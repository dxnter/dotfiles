#!/usr/bin/env bash
source './shared/utils.sh'

# Installs brew cask softwware

macos_apps() {
  print_in_blue "Installing brew cask ..."

	brew_install "caskroom/cask/brew-cask"
	brew_install "caskroom/versions"

  print_in_blue "Installing cask packages ..."

  brew_cask_install "visual-studio-code"
  brew_cask_install "obsidian"
  brew_cask_install "dozer"
  brew_cask_install "vlc"
  brew_cask_install "rectangle"
}

macos_apps
