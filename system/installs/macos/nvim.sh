#!/usr/bin/env bash

cd "$(dirname "${BASH_SOURCE[0]}")" \
    && . "../../utils.sh" \
    && . "./utils.sh"

# - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -

print_info "• Vim"

brew_install "neovim" "neovim"

# - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -

print_info "• Vim Plugins"

nvim -E -s <<-EOF
    :source ~/.vimrc
    :PlugInstall
    :PlugClean
    :qa
EOF

print_success "Vim plugins installed"
