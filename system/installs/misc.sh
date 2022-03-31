#!/usr/bin/env bash

cd "$(dirname "${BASH_SOURCE[0]}")" \
    && . "../utils.sh"

# - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -

print_info "• Miscellaneous"

brew_install "Hidden Bar" "hiddenbar" "--cask"
brew_install "Raycast" "raycast" "--cask"
brew_install "LinearMouse" "linearmouse" "--cask"
brew_install "Transmission" "transmission" "--cask"
brew_install "Unarchiver" "the-unarchiver" "--cask"
brew_install "Obsidian" "obsidian" "--cask"
brew_install "Discord" "discord" "--cask"
brew_install "Zoom" "zoom" "--cask"
