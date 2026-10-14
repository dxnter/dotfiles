#!/usr/bin/env bash

cd "$(dirname "${BASH_SOURCE[0]}")" \
    && . "../utils.sh"

# - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -

change_default_shell_to_zsh() {

    local shellPath=""
    local brewPrefix=""

    brewPrefix="$(brew_prefix)" \
        || return 1

    shellPath="$brewPrefix/bin/zsh"

    # Older Macs skip Homebrew's zsh (no Intel binaries); macOS's zsh is already the default.
    if [ ! -x "$shellPath" ]; then
        print_success "Zsh (using macOS's /bin/zsh)"
        return 0
    fi

    # - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -

    # `chsh` only accepts shells listed in `/etc/shells`.

    if ! grep -qx "$shellPath" /etc/shells; then
        execute \
            "printf '%s\n' '$shellPath' | sudo tee -a /etc/shells" \
            "Zsh (add '$shellPath' in '/etc/shells')" \
        || return 1
    fi

    # - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -

    if [ "$(dscl . -read "/Users/$USER" UserShell | awk '{print $2}')" != "$shellPath" ]; then
        sudo chsh -s "$shellPath" "$USER" &> /dev/null
        print_result $? "Zsh (use $shellPath as login shell)"
    else
        print_success "Zsh (already the login shell)"
    fi

}

install_zsh_plugin() {

    local git_url=$1
    local plugin_name=$2
    local plugin_folder="$HOME/.config/zsh/.oh-my-zsh/custom/plugins/${plugin_name}"

    if [ ! -d "${plugin_folder}" ]; then
        git clone --depth=1 --quiet "${git_url}" "${plugin_folder}"
    fi

}

main() {

    print_info "• Shell Configuration"

    change_default_shell_to_zsh

    # - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -

    print_info "• oh-my-zsh"

    if [ ! -d "$HOME/.config/zsh/.oh-my-zsh" ]; then
        execute "git clone --depth=1 --quiet https://github.com/ohmyzsh/ohmyzsh.git ~/.config/zsh/.oh-my-zsh" \
            "oh-my-zsh"
    else
        print_success "oh-my-zsh (already installed)"
    fi

    # - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -

    print_info "• oh-my-zsh plugins"

    execute "install_zsh_plugin https://github.com/Aloxaf/fzf-tab fzf-tab" \
        "fzf-tab"

    execute "install_zsh_plugin https://github.com/zsh-users/zsh-syntax-highlighting.git zsh-syntax-highlighting" \
        "zsh-syntax-highlighting"

    execute "install_zsh_plugin https://github.com/zsh-users/zsh-autosuggestions.git zsh-autosuggestions" \
        "zsh-autosuggestions"

}

main
