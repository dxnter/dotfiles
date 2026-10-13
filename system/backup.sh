#!/usr/bin/env bash

cd "$(dirname "${BASH_SOURCE[0]}")" \
    && . "utils.sh" \
    && cd ..

# - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -

copy_dotfile() {

    localFile=$1
    sourceDir=$HOME/$localFile
    targetDir=$DOTFILES_DIR/backup/$localFile

    if [ -e "$sourceDir" ]; then
        execute "mkdir -p \"$(dirname "$targetDir")\"" \
            "Create directory → $targetDir"
        execute "cp \"$sourceDir\" \"$targetDir\"" \
            "Copy $sourceDir → $targetDir"
    fi

}

backup_dotfiles() {

    if [ ! -d "$DOTFILES_DIR/backup" ]; then
        execute "mkdir -p $DOTFILES_DIR/backup" \
            "Create directory → $DOTFILES_DIR/backup"
    fi

    while read -r PKG; do
        find "$PKG" -type f | cut -d"/" -f2-
    done < "$DOTFILES_DIR/symlink_dirs" | while read -r line; do
        copy_dotfile "$line"
    done
}

# - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -

main() {
    print_info "• Backup dotfiles"
    backup_dotfiles
}

main
