#!/usr/bin/env bash

cd "$(dirname "${BASH_SOURCE[0]}")" \
    && . "../utils.sh"

# - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -

print_info "• Git"

brew_install "Git" "git"
brew_install "GitHub CLI" "gh"
brew_install "GitHub Desktop" "github" "--cask"
