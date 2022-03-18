#!/usr/bin/env bash

cd "$(dirname "${BASH_SOURCE[0]}")" \
    && . "utils.sh" \
    && cd ..

# - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -

copy_dotfile() {

    localFile=$1
    sourceDir=$HOME/$localFile
    targetDir=$HOME/.dotfiles/backup/$localFile

    if [ -e $sourceDir ]; then
        execute "mkdir -p $(dirname "$targetDir")" \
            "Create directory → $targetDir"
        execute "cp $sourceDir $targetDir" \
            "Copy $sourceDir → $targetDir"
    fi

}

backup_dotfiles() {

    if [ ! -d $HOME/.dotfiles/backup ]; then
        execute "mkdir -p $HOME/.dotfiles/backup" \
            "Create directory → $HOME/.dotfiles/backup"
    fi

    while read PKG; do
        find $PKG -type f | cut -d'/' -f2-
    done < "$HOME/.dotfiles/symlink_dirs" | while read line; do
        copy_dotfile $line
    done
}

# - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -

main() {
    print_info "• Backup dotfiles"
    backup_dotfiles
}

main
