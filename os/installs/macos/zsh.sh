#!/bin/sh

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
    print_info "• zsh"
    brew_install "zsh" "zsh"

    print_info "Defaulting to zsh shell"
    chsh -s $(which zsh)

    print_info "oh-my-zsh"
    sh -c "$(curl -fsSL https://raw.githubusercontent.com/robbyrussell/oh-my-zsh/master/tools/install.sh)"

    print_info "oh-my-zsh plugins"
    install_zsh_plugin https://github.com/zsh-users/zsh-syntax-highlighting.git zsh-syntax-highlighting
    install_zsh_plugin https://github.com/zsh-users/zsh-autosuggestions.git zsh-autosuggestions
    install_zsh_plugin https://github.com/lukechilds/zsh-nvm zsh-nvm
    install_zsh_plugin https://github.com/wfxr/forgit forgit
    install_zsh_plugin https://github.com/asdf-vm/asdf.git asdf

    if [ ! -d "${ZSH_CUSTOM}/themes/powerlevel10k" ]; then
      print_info "powerline10k theme"
      git clone --depth=1 https://github.com/romkatv/powerlevel10k.git ${ZSH_CUSTOM:-$HOME/.oh-my-zsh/custom}/themes/powerlevel10k
    else
      print_info "powerline10k theme already installed => skipping"
    fi
 }

zsh
