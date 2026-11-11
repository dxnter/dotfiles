#!/usr/bin/env bash

cd "$(dirname "${BASH_SOURCE[0]}")" \
    && . "../utils.sh"

# - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -

# Each file in vscode/profiles/ is one VS Code profile: a "# profile: <name>" header and
# one extension ID per line. core.txt goes into every profile. Extensions a profile has
# that its list doesn't name are uninstalled, so the lists are the source of truth.

declare -r PROFILES_DIR="${DOTFILES_DIR:-$HOME/.dotfiles}/vscode/profiles"
declare -r CODE_APP_BIN="/Applications/Visual Studio Code.app/Contents/Resources/app/bin/code"

code_cli() {
    if cmd_exists "code"; then
        command code "$@"
    else
        "$CODE_APP_BIN" "$@"
    fi
}

read_ids() {
    grep -v -E '^\s*(#|$)' "$1" | tr '[:upper:]' '[:lower:]'
}

# $1: profile name ("Default" for the default profile), then any `code` arguments.
code_for_profile() {
    local profile="$1"
    shift

    if [ "$profile" = "Default" ]; then
        code_cli "$@"
    else
        code_cli --profile "$profile" "$@"
    fi
}

sync_profile() {

    local file="$1"
    local profile=""
    local wanted=""
    local installed=""
    local id=""
    local -a args=()

    profile="$(sed -n 's/^# profile: //p' "$file" | head -1)"
    wanted="$( { read_ids "$PROFILES_DIR/core.txt"; read_ids "$file"; } | sort -u)"

    # The CLI can install into a profile but cannot create one.
    if code_for_profile "$profile" --list-extensions 2>&1 | grep -q "not found"; then
        print_warning "$profile: profile missing. Sign in to Settings Sync, which brings the profiles, or create it in the Profiles editor with Use Default Profile for Settings, Keyboard Shortcuts, Snippets and Tasks. Then run 'make vscode' again"
        return 0
    fi

    for id in $wanted; do
        args+=(--install-extension "$id")
    done

    code_for_profile "$profile" "${args[@]}" &> /dev/null
    print_result $? "$profile: install $(wc -w <<< "$wanted" | tr -d ' ') extensions"

    # VS Code refuses to uninstall an extension another installed one depends on,
    # so repeat until a pass removes nothing.
    local pass=0
    local removed=1
    local -a failed=()

    while (( removed && pass < 5 )); do
        removed=0
        failed=()
        pass=$((pass + 1))
        installed="$(code_for_profile "$profile" --list-extensions 2> /dev/null | tr '[:upper:]' '[:lower:]')"

        for id in $installed; do
            grep -qx "$id" <<< "$wanted" && continue
            if code_for_profile "$profile" --uninstall-extension "$id" &> /dev/null; then
                removed=1
                print_result 0 "$profile: uninstall $id"
            else
                failed+=("$id")
            fi
        done
    done

    for id in "${failed[@]}"; do
        print_result 1 "$profile: uninstall $id"
    done

}

main() {

    local file=""

    print_info "• VS Code profiles"

    if ! cmd_exists "code" && [ ! -x "$CODE_APP_BIN" ]; then
        print_error "VS Code not installed (the Brewfile installs it)"
        return 1
    fi

    for file in "$PROFILES_DIR"/*.txt; do
        [ "$(basename "$file")" = "core.txt" ] && continue
        sync_profile "$file"
    done

}

main
