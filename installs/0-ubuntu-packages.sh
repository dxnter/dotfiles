#!/usr/bin/env bash

read -p "Install ubuntu packages? (y/n) " -n 1 -r
echo
if [[ $REPLY =~ ^[Yy]$ ]]; then
  sudo apt-get update
  sudo apt full-upgrade

  echo "[-] Installing CLI tools..."
  # Install additional commands
  sudo apt install build-essential ubuntu-restricted-extras gnome-tweaks cmake git zsh neofetch preload nmap traceroute whois pkg-config libfreetype6-dev libfontconfig1-dev libxcb-xfixes0-dev libxkbcommon-dev python3 xsel neovim htop tree ripgrep exuberant-ctags tmux xclip httpie silversearcher-ag nfs-common net-tools lm-sensors network-manager-openvpn openvpn network-manager-openvpn-gnome curl nnn jq software-properties-common gnome-tweak-tool libssl-dev bison python-setuptools libpq-dev


  echo "[-] Installing Ubuntu applications"
  sudo apt install timeshift vlc

  echo "[-] Installing ubuntu arc theme"
  sudo apt install arc-theme

  echo "[-] Defaulting to zsh"
  chsh -s $(which zsh)

  echo "[-] Instaling oh-my-zsh"
  sh -c "$(curl -fsSL https://raw.githubusercontent.com/robbyrussell/oh-my-zsh/master/tools/install.sh)"

  echo "[-] Configuring system settings"
  sudo systemctl enable fstrim.timer
  sudo sysctl -w fs.inotify.max_user_watches=100000
  sudo ufw enable


  echo "[-] Finished installing Ubuntu packages and switched to zsh"
fi
