#!/usr/bin/env bash

cd "$(dirname "${BASH_SOURCE[0]}")" \
    && . "utils.sh"

# - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -

create_symlinks() {

    local stow=""
    local conflict=""

    stow="$(resolve_bin "stow")"

    while read -r PKG; do

        # Move files that would block stow into backup/ rather than deleting them.
        # Matches stow 2.4's "over existing target <path> since ..." message.
        "$stow" --dir="$DOTFILES_DIR" --target="$HOME" --no --verbose "$PKG" 2>&1 \
            | sed -n 's/.* over existing target \(.*\) since .*/\1/p' \
            | while read -r conflict; do
                execute \
                    "mkdir -p \"$DOTFILES_DIR/backup/$(dirname "$conflict")\" && mv \"$HOME/$conflict\" \"$DOTFILES_DIR/backup/$conflict\"" \
                    "Moved ~/$conflict to backup/"
            done

        execute "\"$stow\" --dir=\"$DOTFILES_DIR\" --target=\"$HOME\" --no-folding --verbose $PKG" \
            "Linked $PKG"

    done < "$DOTFILES_DIR/symlink_dirs"

}

# - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -

main() {
    print_info "• Create symbolic links"
    create_symlinks
}

main
