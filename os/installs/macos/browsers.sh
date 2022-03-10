#!/bin/bash

cd "$(dirname "${BASH_SOURCE[0]}")" \
    && . "../../utils.sh" \
    && . "./utils.sh"

# - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -

print_in_purple "\n   Browsers\n"

# - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -

printf "\n"

brew_install "Chromium" "chromium" "--cask" "homebrew/cask-versions"

# - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -

printf "\n"

brew_install "Firefox" "firefox" "--cask"
brew_install "Firefox Nightly" "firefox-nightly" "--cask" "homebrew/cask-versions"

# - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -
