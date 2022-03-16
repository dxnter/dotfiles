#!/usr/bin/env bash

cd "$(dirname "${BASH_SOURCE[0]}")" \
    && . "utils.sh"

# - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -

create_symlinks() {

    declare -a FILES_TO_SYMLINK=(

        ".config/zsh/.aliases"
        ".config/zsh/.bash_profile"
        ".config/zsh/.hushlogin"
        ".config/zsh/.inputrc"
        ".config/zsh/.p10k.zsh"
        ".config/zsh/.zsh_profile"
        ".config/zsh/.zshrc"
        ".config/zsh/.zshenv"
        "shell/.zshenv"

        "git/.gitconfig"
        "git/.gitignore_global"

        ".config/alacritty/alacritty.yml"
        ".config/asdf/.asdfrc"

        "tmux/.tmux.conf"

        ".config/nvim/init.vim"
        ".config/nvim/plug.vim"
        "vim/.vimrc"

    )

    local i=""
    local sourceFile=""
    local targetFile=""
    local skipQuestions=false

    # - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -

    skip_questions "$@" \
        && skipQuestions=true

    # - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -

    for i in "${FILES_TO_SYMLINK[@]}"; do

        sourceFile="$(cd .. && pwd)/$i"
        if [[ $i == .* ]]; then
            targetFile="$HOME/${i}"
        else
            targetFile="$HOME/$(printf "%s" "$i" | sed "s/.*\/\(.*\)/\1/g")"
        fi

        if [ ! -e "$targetFile" ] || $skipQuestions; then

            execute \
                "ln -fs $sourceFile $targetFile" \
                "$targetFile → $sourceFile"

        elif [ "$(readlink "$targetFile")" == "$sourceFile" ]; then
            print_success "$targetFile → $sourceFile"
        else

            if ! $skipQuestions; then

                ask_for_confirmation "'$targetFile' already exists, do you want to overwrite it?"
                if answer_is_yes; then

                    rm -rf "$targetFile"

                    execute \
                        "ln -fs $sourceFile $targetFile" \
                        "$targetFile → $sourceFile"

                else
                    print_error "$targetFile → $sourceFile"
                fi

            fi

        fi

    done

}

# - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -

main() {
    print_info "• Create symbolic links"
    create_symlinks "$@"
}

main "$@"
