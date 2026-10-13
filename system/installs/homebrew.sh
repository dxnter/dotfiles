#!/usr/bin/env bash

cd "$(dirname "${BASH_SOURCE[0]}")" \
    && . "../utils.sh"

# - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -

install_homebrew() {

    if ! cmd_exists "brew" && [ ! -x "$brewCommand" ]; then
        ask_for_sudo
        execute \
            "NONINTERACTIVE=1 /bin/bash -c \"\$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)\"" \
            "Homebrew (install)" \
            || exit 1
    fi

    # A fresh install is not on PATH yet; load it for the rest of the setup.
    eval "$("$brewCommand" shellenv)"

}

opt_out_of_analytics() {

    execute \
        "$brewCommand analytics off" \
        "Homebrew (opt-out of analytics)"

}

# - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -

main() {

    print_info "• Homebrew"

    install_homebrew
    opt_out_of_analytics

    brew_update
    brew_upgrade

}

main
