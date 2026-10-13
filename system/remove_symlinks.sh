#!/usr/bin/env bash

cd "$(dirname "${BASH_SOURCE[0]}")" \
    && . "utils.sh" \
    && cd ..

# - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -

remove_symlinks() {
    while read -r PKG; do
        execute "$(resolve_bin "stow") --dir=\"$DOTFILES_DIR\" --target=\"$HOME\" --delete $PKG" \
            "Removed symlink for $PKG"
    done < "$DOTFILES_DIR/symlink_dirs"

}

# - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -

main() {
    print_info "• Remove symbolic links"
    remove_symlinks
}

main
