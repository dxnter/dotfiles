#!/usr/bin/env bash

cd "$(dirname "${BASH_SOURCE[0]}")" \
    && . "../utils.sh"

# - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -

print_info "• Poetry"

if type poetry >/dev/null 2>&1; then
  print_info "Poetry already installed => skipping"
else
    execute "pyenv install 3.9.10" \
        "Install Python 3.9.10"

    execute "pyenv global 3.9.10" \
        "Set Python 3.9.10 as global"

    execute "curl -sSL https://install.python-poetry.org | python -" \
        "Installing Poetry"
fi
