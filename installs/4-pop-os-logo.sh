#!/usr/bin/env bash

read -p "Using Pop!_OS? (y/n) " -n 1 -r
echo
if [[ $REPLY =~ ^[Yy]$ ]]; then
  echo "[-] Installing Pop!_OS Kernal Logo"
  sudo apt install plymouth-theme-pop-logo
  sudo update-alternatives --config default.plymouth
  sudo kernelstub -a splash
  sudo kernelstub -v
  sudo update-initramfs -u

  echo "[-] Setting dock click to minimize applications"
  gsettings set org.gnome.shell.extensions.dash-to-dock click-action 'minimize'
fi
