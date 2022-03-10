#!/usr/bin/env bash

cd "$(dirname "${BASH_SOURCE[0]}")" \
    && . "utils.sh"

# - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -

create_directories() {

    declare -a DIRECTORIES=(
        "$HOME/Documents/screenshots",
        "$HOME/Documents/notes",
        "$HOME/code",
        "$HOME/code/work"
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
