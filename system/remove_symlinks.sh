#!/usr/bin/env bash

cd "$(dirname "${BASH_SOURCE[0]}")" \
    && . "utils.sh" \
    && cd ..

# - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -

remove_symlinks() {
    while read PKG; do
        execute "stow --delete $PKG" \
            "Removed symlink for $PKG"
    done < "$HOME/.dotfiles/symlink_dirs"

}

# - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -

main() {
    print_info "• Remove symbolic links"
    remove_symlinks
}

main
