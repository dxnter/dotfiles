#!/usr/bin/env bash
source './shared/utils.sh'

# Installs brew packages and software

brew_packages() {

	if cmd_exists "brew"; then

		print_in_blue "Updating brew packages ..."
		execute "brew update"
		brew upgrade --all

        print_in_blue "Adding external sources ..."
        brew tap homebrew/bundle
        brew tap homebrew/core
        brew tap homebrew/cask

		print_in_blue "Installing shell packages ..."
        brew_install "moreutils"
        brew_install "findutils"
        brew_install "gnu-sed"
        brew_install "gnupg"
		brew_install "tree"
		brew_install "jq"
        brew_install "gpg"
        brew_install "pinetry-mac"
        brew_install "gh"
        brew_install "zsh"
        brew_install "cmake"
        brew_install "fd"
        brew_install "fzf"
        brew_install "lsd"
        brew_install "git-delta"
        brew_install "gpac"
        brew_install "gpatch"
        brew_install "mas"
        brew_install "ag"
        brew_install "pandoc"
        brew_install "ripgrep"
        brew_install "stow"
        brew_install "tldr"
        brew_install "neofetch"
        brew_install "tmux"
        brew_install "htop"
        brew_install "wget"
        brew_install "curl"
        brew_install "grip"

		print_in_blue "Installing developer packages ..."
		brew_install "docker"
        brew_install "docker-compose"
        brew_install "neovim"
        brew_install "git"
        brew_install "http-server"
        brew_install "redis"

        print_in_blue "Installing CTF tools ..."
        brew_install "aircrack-ng"
        brew_install "bfg"
        brew_install "binutils"
        brew_install "binwalk"
        brew_install "cifer"
        brew_install "dex2jar"
        brew_install "dns2tcp"
        brew_install "fcrackzip"
        brew_install "foremost"
        brew_install "hashpump"
        brew_install "hydra"
        brew_install "john"
        brew_install "knock"
        brew_install "netpbm"
        brew_install "nmap"
        brew_install "pngcheck"
        brew_install "socat"
        brew_install "sqlmap"
        brew_install "tcpflow"
        brew_install "tcpreplay"
        brew_install "tcptrace"
        brew_install "ucspi-tcp"
        brew_install "xpdf"
        brew_install "xz"


		# macOS Software
		print_in_blue "macOS Apps."
		./macos-apps.sh

		brew cleanup
	else
		print_error 'brew not installed, the packages cannot be installed without brew.'
		./macos/software/brew-install.sh
	fi
}

brew_packages
