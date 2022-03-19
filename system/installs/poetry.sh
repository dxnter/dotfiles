#!/usr/bin/env bash

cd "$(dirname "${BASH_SOURCE[0]}")" \
    && . "../utils.sh"

# - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -

print_info "• Poetry"

if type poetry >/dev/null 2>&1; then
  print_info "Poetry already installed => skipping"
else
  execute "curl -sSL https://install.python-poetry.org | python3 -" \
      "Installing Poetry"
fi