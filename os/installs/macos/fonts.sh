#!/bin/sh

cd "$(dirname "${BASH_SOURCE[0]}")" \
    && . "../../utils.sh" \
    && . "./utils.sh"

# - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -

print_info "• Hack Fonts"

brew tap homebrew/cask-fonts
brew_install "Hack Nerd Font Complete" "font-hack-nerd-font" "--cask"

print_success "Hack Fonts installed"
