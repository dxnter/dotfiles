#!/usr/bin/env bash

cd "$(dirname "${BASH_SOURCE[0]}")" \
    && . "utils.sh"

# The private key lives in 1Password and never touches disk. The agent serves
# keys from the Private/Personal vault; only the public key is written to ~/.ssh.

declare -r OP_AGENT_SOCK="$HOME/Library/Group Containers/2BUA8C4S2C.com.1password/t/agent.sock"
declare -r OP_SSH_SIGN="/Applications/1Password.app/Contents/MacOS/op-ssh-sign"

# The 1Password item is titled after this Mac. A title may carry a suffix
# ("athena — SSH auth + commit signing") and still match.
KEY_NAME="$(scutil --get LocalHostName 2> /dev/null || hostname -s)"
declare -r KEY_NAME
declare -r PUBLIC_KEY_FILE="$HOME/.ssh/${KEY_NAME}.pub"

declare -r GH="${XDG_DATA_HOME:-$HOME/.local/share}/mise/shims/gh"

# - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -

agent_keys() {
    SSH_AUTH_SOCK="$OP_AGENT_SOCK" ssh-add -L 2> /dev/null
}

find_key() {

    # Match on the key comment, which the agent sets to the item title.
    # Only this Mac's key is used, never another key the agent happens to serve.
    agent_keys | awk -v name="$KEY_NAME" '
        { comment = $0; sub(/^[^ ]+ [^ ]+ /, "", comment) }
        comment == name || index(comment, name " ") == 1 { print $1, $2; exit }
    '

}

check_1password_agent() {

    # ssh-add exits 2 when it can't reach the agent, 1 when the agent has no keys.
    SSH_AUTH_SOCK="$OP_AGENT_SOCK" ssh-add -l &> /dev/null

    if [ $? -eq 2 ]; then
        print_error "The 1Password SSH agent isn't running"
        print_warning "In 1Password, turn on Settings → Developer → 'Use the SSH agent', then run 'make ssh' again"
        exit 1
    fi

    print_result 0 "1Password SSH agent is running"

}

create_1password_key() {

    local i=""

    if ! cmd_exists "op" || ! op item create \
            --category "SSH Key" \
            --title "$KEY_NAME" \
            --ssh-generate-key ed25519 &> /dev/null; then
        print_error "Couldn't create the SSH key with the 1Password CLI"
        print_warning "Create it in 1Password: New Item → SSH Key → Generate New Key → Ed25519, titled '$KEY_NAME'. Then run 'make ssh' again"
        exit 1
    fi

    # The agent picks up new items within a few seconds.
    for i in {1..10}; do
        [ -n "$(find_key)" ] && break
        sleep 1
    done

    print_result 0 "Create SSH key '$KEY_NAME' in 1Password"

}

write_public_key() {

    local key=""

    key="$(find_key)"

    if [ -z "$key" ]; then
        create_1password_key
        key="$(find_key)"
    fi

    if [ -z "$key" ]; then
        print_error "1Password created '$KEY_NAME', but the SSH agent isn't serving it"
        print_warning "Keep the item in your Private/Personal vault, then run 'make ssh' again"
        exit 1
    fi

    mkdir -p "$HOME/.ssh" \
        && chmod 700 "$HOME/.ssh" \
        && printf "%s %s\n" "$key" "$KEY_NAME" > "$PUBLIC_KEY_FILE" \
        && chmod 644 "$PUBLIC_KEY_FILE"

    print_result $? "Write public key to $PUBLIC_KEY_FILE"

}

add_ssh_configs() {

    local config="$HOME/.ssh/config"

    touch "$config"

    # IdentitiesOnly pins github.com to this key, so the agent's other keys
    # (deploy keys and the like) are never offered to it.
    if grep -q "^Host github.com" "$config"; then
        print_warning "$config already has a 'Host github.com' block; make sure it uses $PUBLIC_KEY_FILE"
    else
        printf "%s\n" \
            "" \
            "Host github.com" \
            "  IdentityFile ~/.ssh/${KEY_NAME}.pub" \
            "  IdentitiesOnly yes" \
            "  LogLevel ERROR" >> "$config"
    fi

    if ! grep -q "IdentityAgent" "$config"; then
        printf "%s\n" \
            "" \
            "Host *" \
            "  IdentityAgent \"~/Library/Group Containers/2BUA8C4S2C.com.1password/t/agent.sock\"" >> "$config"
    fi

    chmod 600 "$config"

    print_result $? "Add SSH configs"

}

use_key_for_commit_signing() {

    local allowedSigners="$HOME/.config/git/allowed_signers"
    local email=""
    local key=""

    email="$(git config --file "$HOME/.gitconfig.local" user.email)"
    key="$(cut -d " " -f 1,2 "$PUBLIC_KEY_FILE")"

    if [ -z "$email" ]; then
        print_error "Set user.email in ~/.gitconfig.local, then run 'make ssh' again"
        return 1
    fi

    git config --file "$HOME/.gitconfig.local" user.signingkey "$key" \
        && git config --file "$HOME/.gitconfig.local" gpg.format ssh \
        && git config --file "$HOME/.gitconfig.local" gpg.ssh.program "$OP_SSH_SIGN" \
        && mkdir -p "$(dirname "$allowedSigners")" \
        && touch "$allowedSigners" \
        && {
            grep -qF "$key" "$allowedSigners" \
                || printf "%s namespaces=\"git\" %s\n" "$email" "$key" >> "$allowedSigners"
        }

    print_result $? "Sign commits with $PUBLIC_KEY_FILE through 1Password"

}

github_has_key() {

    # $1: authentication or signing
    "$GH" ssh-key list 2> /dev/null \
        | awk -F "\t" -v key="$(cut -d " " -f 2 "$PUBLIC_KEY_FILE")" -v type="$1" \
            'index($2, key) && $5 == type { found = 1 } END { exit !found }'

}

add_key_to_github() {

    local title="$KEY_NAME (1Password)"
    local type=""

    if [ ! -x "$GH" ] || ! "$GH" auth status &> /dev/null; then
        copy_public_ssh_key_to_clipboard
        open_github_ssh_page
        return 0
    fi

    # Adding keys needs scopes that `gh auth login` doesn't request by default.
    if ! "$GH" auth status 2>&1 | grep -q "admin:ssh_signing_key"; then
        "$GH" auth refresh -h github.com -s admin:public_key -s admin:ssh_signing_key
    fi

    for type in authentication signing; do
        github_has_key "$type" \
            || "$GH" ssh-key add "$PUBLIC_KEY_FILE" --title "$title" --type "$type" &> /dev/null
        print_result $? "Add $PUBLIC_KEY_FILE to GitHub as a $type key"
    done

}

copy_public_ssh_key_to_clipboard () {
    pbcopy < "$PUBLIC_KEY_FILE"
    print_result $? "Copy public SSH key to clipboard"
}

open_github_ssh_page() {

    declare -r GITHUB_SSH_URL="https://github.com/settings/ssh/new"

    # GitHub needs the key twice: once as an Authentication key, once as a Signing key.
    print_warning "Add the copied key on GitHub twice: Key type 'Authentication Key', then again as 'Signing Key'"

    if cmd_exists "open"; then
        open "$GITHUB_SSH_URL"
    else
        print_warning "Please add the public SSH key to GitHub ($GITHUB_SSH_URL)"
    fi

}

test_ssh_connection() {

    print_warning "Approve the 1Password prompt to finish connecting to GitHub"

    while true; do

        ssh -T git@github.com &> /dev/null
        [ $? -eq 1 ] && break

        sleep 5

    done

    print_result 0 "Connect to GitHub with $PUBLIC_KEY_FILE"

}

use_gh_for_https_credentials() {

    # SSH covers git@github.com remotes; this lets HTTPS remotes reuse the
    # `gh auth login` token. Kept in ~/.gitconfig.local because `gh auth setup-git`
    # would write into ~/.gitconfig, which is this repo's tracked git/.gitconfig.
    # The mise shim keeps working across `mise upgrade`.
    local host=""

    if [ ! -x "$GH" ]; then
        print_warning "GitHub CLI not installed; run 'make mise', then 'make ssh' again"
        return 0
    fi

    for host in https://github.com https://gist.github.com; do
        git config --file "$HOME/.gitconfig.local" --unset-all "credential.$host.helper" &> /dev/null
        git config --file "$HOME/.gitconfig.local" --add "credential.$host.helper" "" \
            && git config --file "$HOME/.gitconfig.local" --add "credential.$host.helper" "!$GH auth git-credential" \
            || break
    done

    print_result $? "Use the GitHub CLI for HTTPS credentials"

    if ! "$GH" auth status &> /dev/null; then
        print_warning "Run 'gh auth login' so HTTPS remotes can authenticate"
    fi

}

set_github_ssh_key() {

    check_1password_agent
    write_public_key
    add_ssh_configs
    use_key_for_commit_signing
    add_key_to_github
    test_ssh_connection

}

# - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -

main() {

    print_info "• Set up GitHub SSH keys"

    # - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -

    if ! is_git_repository; then
        print_error "Not a Git repository"
        exit 1
    fi

    # - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -

    ssh -T git@github.com &> /dev/null

    if [ $? -ne 1 ]; then
        set_github_ssh_key
    fi

    use_gh_for_https_credentials

    # - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -

    print_result $? "Set up GitHub SSH keys"

}

main
