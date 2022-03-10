#!/usr/bin/env bash
source './shared/utils.sh'

# Install Homebrew

install_brew() {
		/bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"
		if cmd_exists "brew"; then
			print_success 'Brew has been succesfully installed!'
		else
			print_error 'Brew not installed.'
		fi
}

install_brew
