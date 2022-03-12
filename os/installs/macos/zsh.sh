#!/bin/bash

cd "$(dirname "${BASH_SOURCE[0]}")" \
    && . "../../utils.sh" \
    && . "./utils.sh"

# - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -
install_zsh_plugin() {
  local git_url=$1
  local plugin_name=$2
  local plugin_folder="${ZSH_CUSTOM}/plugins/${plugin_name}"
  if [ ! -d "${plugin_folder}" ]; then
    echo "[-] installing zsh plugin ${plugin_name}"
    git clone "${git_url}" "${plugin_folder}"
  else
    echo "[-] zsh plugin ${plugin_name} already exists => skipping"
  fi
}

zsh() {
    print_info "• Shell Configuration"
    brew_install "zsh" "zsh"
    [[ -n "$(command -v brew)" ]] && zsh_path="$(brew --prefix)/bin/zsh" || zsh_path="$(which zsh)"
    if ! grep "$zsh_path" /etc/shells; then
        print_info "Adding $zsh_path to /etc/shells"
        echo "$zsh_path" | sudo tee -a /etc/shells
    fi

    if [[ "$SHELL" != "$zsh_path" ]]; then
        chsh -s "$zsh_path"
        print_info "Default shell changed to $zsh_path"
    fi

    print_info "oh-my-zsh"
    git clone --depth=1 git://github.com/robbyrussell/oh-my-zsh.git ~/.oh-my-zsh --quiet

    print_info "oh-my-zsh plugins"
    install_zsh_plugin https://github.com/asdf-vm/asdf.git asdf
    install_zsh_plugin https://github.com/Aloxaf/fzf-tab fzf-tab
    install_zsh_plugin https://github.com/zsh-users/zsh-syntax-highlighting.git zsh-syntax-highlighting
    install_zsh_plugin https://github.com/zsh-users/zsh-autosuggestions.git zsh-autosuggestions

    if [ ! -d "${ZSH_CUSTOM}/themes/powerlevel10k" ]; then
      print_info "powerline10k theme"
      git clone --depth=1 https://github.com/romkatv/powerlevel10k.git ${ZSH_CUSTOM:-$HOME/.oh-my-zsh/custom}/themes/powerlevel10k
    else
      print_info "powerline10k theme already installed => skipping"
    fi
 }

zsh
