#!/usr/bin/env bash

echo "[-] Installing Hack nerd-font"
git clone https://github.com/ryanoasis/nerd-fonts --depth 1 /tmp/nerd-fonts
pushd /tmp/nerd-fonts && ./install.sh Hack && popd
