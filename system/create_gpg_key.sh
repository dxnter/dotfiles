#!/usr/bin/env bash

cd "$(dirname "${BASH_SOURCE[0]}")" \
    && . "utils.sh"

declare -a gpgIdentifier

# - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -

add_gpg_config() {

    printf "%s\n" \
        "auto-key-retrieve" \
        "no-emit-version" \
        "use-agent" \
        "no-tty" >> ~/.gnupg/gpg.conf

    printf "%s\n" \
        "default-cache-ttl 600" \
        "max-cache-ttl 7200" \
        "pinentry-program $(brew --prefix)/bin/pinentry-mac" >> ~/.gnupg/gpg-agent.conf

    execute "chmod 700 ~/.gnupg" \
        "Set permissions for gpg directory"

    print_result $? "Add GPG configs"
}

generate_gpg_key() {

    gpg --full-gen-key

    gpgIdentifier=$(gpg --list-signatures --with-colons | grep 'sig' | tail -n 1 | cut -d':' -f5)

    print_result $? "Generate GPG key"
}

modify_local_git_config() {

    sed -i '' 's|signingkey =|signingkey = '"$gpgIdentifier"'|g' ~/test.txt

    print_result $? "Add GPG Key $gpgIdentifier to .gitconfig.local"
}

copy_public_gpg_key_to_clipboard() {

    gpg --armor --export $gpgIdentifier | pbcopy

    print_result $? "Copy public GPG key to clipboard"
}

open_github_keys_page() {
    declare -r GITHUB_KEYS_URL="https://github.com/settings/keys"

    open "$GITHUB_KEYS_URL"

    print_result $? "Open GitHub keys page to add the public GPG key"
}



set_github_gpg_key() {

    add_gpg_config
    generate_gpg_key
    modify_local_git_config
    copy_public_gpg_key_to_clipboard
    open_github_keys_page

    gpgconf --kill gpg-agent
}

# - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -

main() {

    print_info "• Set up GitHub GPG Key"

    set_github_gpg_key
 }

 main
