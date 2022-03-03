#!/usr/bin/env zsh

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

install_zsh_plugin https://github.com/zsh-users/zsh-syntax-highlighting.git zsh-syntax-highlighting
install_zsh_plugin https://github.com/zsh-users/zsh-autosuggestions.git zsh-autosuggestions
install_zsh_plugin https://github.com/lukechilds/zsh-nvm zsh-nvm
install_zsh_plugin https://github.com/wfxr/forgit forgit


if [ ! -d "${ZSH_CUSTOM}/themes/powerlevel10k" ]; then
  echo "[-] installing powerlevel10k theme"
  git clone --depth=1 https://github.com/romkatv/powerlevel10k.git ${ZSH_CUSTOM:-$HOME/.oh-my-zsh/custom}/themes/powerlevel10k
else
  echo "[-] powerlevel10k theme already installed => skipping"
fi
