#!/usr/bin/env bash

asdf_version="0.9.0"
asdf_home="$HOME/.asdf"

if [ ! -d "${asdf_home}" ]; then
  echo "[-] Installing asdf"
  git clone https://github.com/asdf-vm/asdf.git ~/.asdf --branch "v${asdf_version}"
else
  echo "[-] asdf already installed => skipping"
fi
