#!/usr/bin/env bash

cd "$(dirname "${BASH_SOURCE[0]}")" \
    && . "../utils.sh"

# - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -

print_info "• Poetry"

if type poetry >/dev/null 2>&1; then
  print_info "Poetry already installed => skipping"
else
  pythonPath=""

  if [[ "$(arch)" == "arm64" ]]; then
      pythonPath="/opt/homebrew/bin/python3"
  else
      pythonPath="/usr/local/bin/python3"
  fi

  execute "curl -sSL https://install.python-poetry.org | $pythonPath -" \
      "Installing Poetry"
fi
