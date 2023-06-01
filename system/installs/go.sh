#!/usr/bin/env bash

cd "$(dirname "${BASH_SOURCE[0]}")" \
    && . "../utils.sh"

# - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -

print_info "• Go"

if type go >/dev/null 2>&1; then
  print_info "Go already installed => skipping"
else
  brew_install "Go" "go"
  mkdir -p $HOME/go/{bin,src,pkg}
fi
