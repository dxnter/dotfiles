#!/usr/bin/env bash

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
    # Need these to install ppas and setup scripts
    printsl "[-] Installing prerequesites before installing PPAs"
    sudo apt update
    sudo apt install apt-transport-https curl software-properties-common

    printsl "[-] Adding Git Core PPA for latest stable upstream of Git"
    add-apt-repository ppa:git-core/ppa

    # Update system && install packages
    printsl "[-] Updating System"
    sudo apt-get update && sudo apt upgrade -y

    printsl "[-] Installing apt packages"
    cat apt.list | xargs sudo apt-get -y install

    # Remove geary
    printsl "[-] Removing geary"
    sudo apt purge --auto-remove -y geary

    # Enable Firewall
    printsl "[-] Enabling firewall"
    sudo ufw enable

    # System settings
    printsl "[-] Configuring system settings"
    sudo systemctl enable fstrim.timer
    sudo sysctl -w fs.inotify.max_user_watches=100000

    sudo adduser "$(whoami)" libvirtd

    # Installing Flatpaks
    printsl "[-] Installing flatpaks"
    flatpak install flathub \
        com.spotify.Client \
        us.zoom.Zoom

    # Add Pop!_OS boot splash screen
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
    # Install macos devtools
    printsl "[-] Installing terminal tools"
    xcode-select --install

    # install homebrew
    printsl "[-] Installing homebrew"
    /bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"
    brew doctor

    # Install brew packages
    # Add docker to the brewfile
    # Add git-delta to brewfile
    # Add fd to brewfile
    # Add lsd to brewfile
    # Add docker-compose to the brewfile
    printsl "[-] Installing brew packages"
    brew bundle install --no-lock

    # Add system defaults
}

crossplatform_section() {
    # Update locate db
    if [ "$PLATFORM" == "Darwin"]; then
        sudo /usr/libexec/locate.updatedb
    else
        sudo updatedb
    fi

    printsl "[-] Defaulting to zsh"
    chsh -s $(which zsh)

    printsl "[-] Installing oh-my-zsh"
    sh -c "$(curl -fsSL https://raw.githubusercontent.com/robbyrussell/oh-my-zsh/master/tools/install.sh)"

    sh $CONFIG_DIR/installs/1-asdf.sh
    sh $CONFIG_DIR/installs/1-ctop.sh
    sh $CONFIG_DIR/installs/1-delta.sh
    sh $CONFIG_DIR/installs/1-docker.sh
    sh $CONFIG_DIR/installs/1-lsd.sh
    sh $CONFIG_DIR/installs/1-rust.sh
    sh $CONFIG_DIR/installs/1-tmux.sh
    sh $CONFIG_DIR/installs/2-alacritty.sh
    sh $CONFIG_DIR/installs/2-asdf.bat.sh
    sh $CONFIG_DIR/installs/2-asdf.nodejs.sh
    sh $CONFIG_DIR/installs/2-asdf.python.sh
    sh $CONFIG_DIR/installs/2-docker-compose.sh
    sh $CONFIG_DIR/installs/3-poetry.sh
    sh $CONFIG_DIR/installs/3-zsh-plugins.sh
    sh $CONFIG_DIR/installs/4-nerd-fonts.sh
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
