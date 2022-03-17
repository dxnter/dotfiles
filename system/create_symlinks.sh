#!/usr/bin/env bash

cd "$(dirname "${BASH_SOURCE[0]}")" \
    && . "utils.sh" \
	&& cd ..

# - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -

create_symlinks() {
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
				execute "rm -f $HOME/$filename" \
					"Deleted $filename"
			fi
		done

		execute "stow --no-folding --verbose $PKG" \
			"Linked $PKG"
	done

}

# - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -

main() {
	print_info "• Create symbolic links"
	create_symlinks
}

main
