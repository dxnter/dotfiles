#!/usr/bin/env bash

cd "$(dirname "${BASH_SOURCE[0]}")" \
    && . "../../utils.sh" \
    && . "./utils.sh"

# - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -

print_info "• tmux"

brew_install "tmux" "tmux"
brew_install "tmux (pasteboard)" "reattach-to-user-namespace"

print_success "tmux installed"
