#!/usr/bin/env bash

PACKAGES=(
	alacritty
    asdf
    git
    nvim
    tmux
    zsh
)

for PKG in ${PACKAGES[@]}; do
	CONFLICTS=$(stow --no --verbose $PKG 2>&1 | awk '/\* existing target is/ {print $NF}')
	for filename in ${CONFLICTS[@]}; do
		if [[ -f $HOME/$filename || -L $HOME/$filename ]]; then
			echo "DELETE: $filename"
			rm -f "$HOME/$filename"
		fi
	done

	stow --no-folding --verbose $PKG
done
