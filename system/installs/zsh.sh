#!/usr/bin/env bash

cd "$(dirname "${BASH_SOURCE[0]}")" \
    && . "../utils.sh"

# - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -

change_default_shell_to_zsh() {

  declare -r LOCAL_SHELL_CONFIG_FILE="$HOME/.zshrc.local"

  local configs=""
  local pathConfig=""

  local shellPath=""
  local brewPrefix=""

  # - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -

  # Try to get the path of the `Bash`
    # version installed through `Homebrew`.

    brewPrefix="$(brew_prefix)" \
        || return 1

    pathConfig="PATH=\"$brewPrefix/bin:\$PATH\""
    configs="
# - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -

$pathConfig
export PATH
"

    shellPath="$brewPrefix/bin/zsh" \

    # - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -

    # Add the path of the `Zsh` version installed through `Homebrew`
    # to the list of login shells from the `/etc/shells` file.
    #
    # This needs to be done because applications use this file to
    # determine whether a shell is valid (e.g.: `chsh` consults the
    # `/etc/shells` to determine whether an unprivileged user may
    # change the login shell for her own account).
    #
    # http://www.linuxfromscratch.org/blfs/view/7.4/postlfs/etcshells.html

    if ! grep "$shellPath" < /etc/shells &> /dev/null; then
        execute \
            "printf '%s\n' '$shellPath' | sudo tee -a /etc/shells" \
            "Zsh (add '$shellPath' in '/etc/shells')" \
        || return 1
    fi

    # - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -

    chsh -s "$shellPath" &> /dev/null
    print_result $? "Zsh (use latest version)"

    # - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -

    # If needed, add the necessary configs in the
    # local shell configuration file.

    if ! grep "^$pathConfig" < "$LOCAL_SHELL_CONFIG_FILE" &> /dev/null; then
        execute \
            "printf '%s' '$configs' >> $LOCAL_SHELL_CONFIG_FILE \
                && . $LOCAL_SHELL_CONFIG_FILE" \
            "Zsh (update $LOCAL_SHELL_CONFIG_FILE)"
    fi

}

install_zsh_plugin() {
  local git_url=$1
  local plugin_name=$2
  local plugin_folder="$HOME/.config/zsh/.oh-my-zsh/custom/plugins/${plugin_name}"
  if [ ! -d "${plugin_folder}" ]; then
    echo "[-] installing zsh plugin ${plugin_name}"
    git clone "${git_url}" "${plugin_folder}"
  else
    echo "[-] zsh plugin ${plugin_name} already exists => skipping"
  fi
}

zsh() {

    print_info "• Shell Configuration"

    brew_install "zsh" "zsh" \
        && change_default_shell_to_zsh

    # - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -

    print_info "• oh-my-zsh"

    if [ ! -d "$HOME/.config/zsh/.oh-my-zsh" ]; then
        execute "git clone --depth=1 https://github.com/robbyrussell/oh-my-zsh.git ~/.config/zsh/.oh-my-zsh --quiet" \
            "oh-my-zsh"
    else
        print_info "oh-my-zsh already installed => skipping"
    fi

    # - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -

    print_info "• oh-my-zsh plugins"

    execute "install_zsh_plugin https://github.com/asdf-vm/asdf.git asdf" \
        "asdf"

    execute "install_zsh_plugin https://github.com/Aloxaf/fzf-tab fzf-tab" \
        "fzf-tab"

    execute "install_zsh_plugin https://github.com/zsh-users/zsh-syntax-highlighting.git zsh-syntax-highlighting" \
        "zsh-syntax-highlighting"

    execute "install_zsh_plugin https://github.com/zsh-users/zsh-autosuggestions.git zsh-autosuggestions" \
        "zsh-autosuggestions"

    # - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -

    if [ ! -d "$HOME/.config/zsh/.oh-my-zsh/custom/themes/powerlevel10k" ]; then
      print_info "powerline10k theme"
      execute "git clone --depth=1 https://github.com/romkatv/powerlevel10k.git $HOME/.config/zsh/.oh-my-zsh/custom/themes/powerlevel10k" \
        "powerline10k theme"
    else
      print_info "powerline10k theme already installed => skipping"
    fi

 }

zsh
