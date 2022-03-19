#!/usr/bin/env bash

cd "$(dirname "${BASH_SOURCE[0]}")" \
    && . "utils.sh" \
    && cd ..

# - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -

create_symlinks() {
    while read PKG; do
        CONFLICTS=$($(get_stow_bin) --no --verbose $PKG 2>&1 | awk '/\* existing target is/ {print $NF}')
        for filename in ${CONFLICTS[@]}; do
            if [[ -f $HOME/$filename || -L $HOME/$filename ]]; then
                execute "rm -f $HOME/$filename" \
                    "Deleted $filename"
            fi
        done

        execute "$(get_stow_bin) --no-folding --verbose $PKG" \
            "Linked $PKG"
    done < "$HOME/.dotfiles/symlink_dirs"

}

# - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -

main() {
    print_info "• Create symbolic links"
    create_symlinks
}

main
