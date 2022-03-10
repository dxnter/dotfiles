#!/usr/bin/env bash

cd "$(dirname "${BASH_SOURCE[0]}")" \
    && . "../../utils.sh" \
    && . "./utils.sh"

# - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -

print_info "• GPG"

brew_install "GPG" "gpg"
brew_install "Pinentry" "pinentry-mac"

print_info "GPG installed"
