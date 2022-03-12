#!/bin/bash

cd "$(dirname "${BASH_SOURCE[0]}")" \
    && . "../../utils.sh" \
    && . "./utils.sh"

# - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -

print_info "• Vim"

brew_install "neovim" "neovim"

print_info "• Vim Plugins"


nvim -E +PlugInstall +qall || true

print_success "Vim plugins installed"
