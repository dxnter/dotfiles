#!/bin/sh

if type alacritty >/dev/null 2>&1; then
  echo "[-] alacritty already installed => skipping"
else
  echo "[-] Installing alacritty"
  cargo install alacritty
fi
