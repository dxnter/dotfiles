#!/usr/bin/env bash

cd "$(dirname "${BASH_SOURCE[0]}")" \
    && . "../utils.sh"

# - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -

print_info "• Miscellaneous"

brew_install "Rectangle" "rectangle" "--cask"
brew_install "Dozer" "dozer" "--cask"
brew_install "Alfred" "alfred" "--cask"
brew_install "Mos" "mos" "--cask"
brew_install "Mullvad" "mullvadvpn" "--cask"
brew_install "Transmission" "transmission" "--cask"
brew_install "Unarchiver" "the-unarchiver" "--cask"
brew_install "VLC" "vlc" "--cask"
brew_install "Discord" "discord" "--cask"
brew_install "Obsidian" "obsidian" "--cask"
