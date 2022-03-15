#!/usr/bin/env bash

cd "$(dirname "${BASH_SOURCE[0]}")" \
    && . "../utils.sh"

# - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -

agree_with_xcode_licence() {

    # Automatically agree to the terms of the `Xcode` license.
    # https://github.com/alrra/dotfiles/issues/10

    sudo xcodebuild -license accept &> /dev/null
    print_result $? "Agree to the terms of the Xcode licence"

}

are_xcode_command_line_tools_installed() {
    xcode-select --print-path &> /dev/null
}

install_xcode_command_line_tools() {

    # If necessary, prompt user to install
    # the `Xcode Command Line Tools`.

    xcode-select --install &> /dev/null

    # - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -

    # Wait until the `Xcode Command Line Tools` are installed.

    execute \
        "until are_xcode_command_line_tools_installed; do \
            sleep 5; \
         done" \
        "Xcode Command Line Tools"

}

# - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -

main() {

    print_info "• Xcode"

    install_xcode_command_line_tools
    agree_with_xcode_licence
}

main
