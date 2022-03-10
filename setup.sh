#!/usr/bin/env bash

# TODO: Source utils file
execution_dir=$( cd "$( dirname "${BASH_SOURCE[0]}" )" && pwd )

clear
print_in_orange '\nOS X Config Dotfiles - Carlos Cuesta\n\n'
ask_for_sudo

chmod u+x ./shared/installs/*.sh


#####################
# Setup Environment / Vars
#####################
SOURCE_DIR=$HOME/Source
CONFIG_DIR="$HOME/.config"
[ -d "$SOURCE_DIR" ] && DOTFILES="$SOURCE_DIR/dotfiles" || DOTFILES="$CONFIG_DIR/dotfiles"
TMP="/tmp"
PLATFORM="$(uname -s)"

printsl() {
    echo "" # newline
    echo "$1"
    sleep 0.5
}

popos_install() {
    printsl "[-] Installing prerequesites before installing PPAs"
    sudo apt update
    sudo apt install apt-transport-https curl software-properties-common

    printsl "[-] Adding Git Core PPA for latest stable upstream of Git"
    add-apt-repository ppa:git-core/ppa

    printsl "[-] Updating System"
    sudo apt-get update && sudo apt upgrade -y

    printsl "[-] Installing apt packages"
    cat apt.list | xargs sudo apt-get -y install

    printsl "[-] Removing geary"
    sudo apt purge --auto-remove -y geary

    printsl "[-] Enabling firewall"
    sudo ufw enable

    printsl "[-] Configuring system settings"
    sudo systemctl enable fstrim.timer
    sudo sysctl -w fs.inotify.max_user_watches=100000

    sudo adduser "$(whoami)" libvirtd

    printsl "[-] Installing flatpaks"
    flatpak install flathub \
        com.spotify.Client \
        us.zoom.Zoom

    printsl "[-] Adding Pop!_OS kernal logo"
    sudo apt install plymouth-theme-pop-logo
    sudo update-alternatives --config default.plymouth
    sudo kernelstub -a splash
    sudo kernelstub -v
    sudo update-initramfs -u

    printsl "[-] Setting dock click to minimize applications"
    gsettings set org.gnome.shell.extensions.dash-to-dock click-action 'minimize'

    printsl "[-] Finished installing Linux packages and switched to zsh"
}


macos_install() {
    printsl "[-] Installing terminal tools"
    xcode-select --install

    printsl "[-] Installing Homebrew"
    /bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"
    brew doctor

    printsl "[-] Installing brew packages"
    ./shared/installs/1-brew.sh

    # Add system defaults
}

crossplatform_section() {
    # Update locate db
    if [ "$PLATFORM" == "Darwin"]; then
        sudo /usr/libexec/locate.updatedb
    else
        sudo updatedb
    fi

    printsl "[-] Defaulting to zsh shell"
    chsh -s $(which zsh)

    printsl "[-] Installing oh-my-zsh framework for zsh"
    sh -c "$(curl -fsSL https://raw.githubusercontent.com/robbyrussell/oh-my-zsh/master/tools/install.sh)"

    ./shared/installs/1-asdf.sh
    ./shared/installs/1-ctop.sh
    ./shared/installs/1-delta.sh
    ./shared/installs/1-docker.sh
    ./shared/installs/1-lsd.sh
    ./shared/installs/1-rust.sh
    ./shared/installs/1-tmux.sh
    ./shared/installs/2-alacritty.sh
    ./shared/installs/2-asdf.bat.sh
    ./shared/installs/2-asdf.nodejs.sh
    ./shared/installs/2-asdf.python.sh
    ./shared/installs/2-docker-compose.sh
    ./shared/installs/3-poetry.sh
    ./shared/installs/3-zsh-plugins.sh
    ./shared/installs/4-nerd-fonts.sh
}

main() {
    # Git Clone dotfiles repo, if not already present
    [ ! -d "$DOTFILES" ] && git clone https://github.com/fitzypop/dotfiles.git "$DOTFILES"
    cd "$DOTFILES"

    if [ "$PLATFORM" == "Linux" ]; then
        popos_install
    else
        macos_install
    fi

    crossplatform_section

    for filename in $(find . -name "install.sh")
    do
        source "$filename"
    done
}
main
