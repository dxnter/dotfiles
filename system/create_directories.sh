#!/usr/bin/env bash

cd "$(dirname "${BASH_SOURCE[0]}")" \
    && . "utils.sh"

# - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -

create_directories() {

    declare -a DIRECTORIES=(
        "$HOME/.gnupg"
        "$HOME/.config/alacritty"
        "$HOME/.config/asdf"
        "$HOME/.config/nvim"
        "$HOME/.config/zsh"
        "$HOME/Documents/screenshots"
        "$HOME/Documents/notes"
        "$HOME/dev"
    )

    for i in "${DIRECTORIES[@]}"; do
        mkd "$i"
    done

}

# - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -

main() {
    print_info "• Create directories"
    create_directories
}

main
