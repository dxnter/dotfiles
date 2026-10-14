#!/usr/bin/env bash

cd "$(dirname "${BASH_SOURCE[0]}")" \
    && . "../utils.sh"

# - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -

install_mise() {

    # The official installer ships a prebuilt binary for Intel and Apple Silicon;
    # Homebrew has no Intel bottle and would compile it from source.
    if [ ! -x "$HOME/.local/bin/mise" ] && ! cmd_exists "mise"; then
        execute "curl -fsSL https://mise.run | sh" \
            "mise (install)" \
            || return 1
    fi

}

main() {

    local mise=""

    print_info "• mise"

    install_mise || exit 1

    mise="$HOME/.local/bin/mise"
    [ -x "$mise" ] || mise="$(command -v mise)"

    # Same check as .zshenv: pin older tool versions on macOS 13 and below.
    if [ "$(uname -r | cut -d. -f1)" -lt 23 ]; then
        export MISE_ENV="legacy"
    fi

    # Reads ~/.config/mise/config.toml, so symlinks must exist first.
    "$mise" install --yes
    print_result $? "mise install (runtimes and CLI tools${MISE_ENV:+, legacy pins})"

}

main
