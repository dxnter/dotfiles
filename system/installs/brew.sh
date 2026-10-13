#!/usr/bin/env bash

cd "$(dirname "${BASH_SOURCE[0]}")" \
    && . "../utils.sh"

# - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -

print_info "• Brewfile"

# Not wrapped in `execute`: casks can prompt for a password, and the
# per-package output is the only progress shown during a long install.
"$brewCommand" bundle install --file="$DOTFILES_DIR/Brewfile"
print_result $? "Brewfile packages"
