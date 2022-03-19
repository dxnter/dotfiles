#!/usr/bin/env bash

cd "$(dirname "${BASH_SOURCE[0]}")" \
    && . "../utils.sh"

# - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -

print_info "• Browsers"

# - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -

brew_install "Chrome Canary" "google-chrome-canary" "--cask" "homebrew/cask-versions"

# - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -

brew_install "Firefox" "firefox" "--cask"

# - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -
