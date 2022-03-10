#!/usr/bin/env bash

echo "[-] Creating folders..."
mkdir -p $HOME/apps
mkdir -p $HOME/code
mkdir -p $HOME/work
mkdir -p $HOME/personal
mkdir -p $HOME/bin
mkdir -p $HOME/.undodir

./bootstrap.sh

for f in installs/*.sh; do
  ./$f
done

echo "[-] Installation complete!"
