#!/usr/bin/env bash

cd "$(dirname "${BASH_SOURCE[0]}")" \
    && . "../utils.sh"

# - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -

print_info "• Hack Fonts"

execute "brew_install 'Hack Nerd Font Complete' 'font-fira-code' '--cask'" \
    "Fira Code Font"
