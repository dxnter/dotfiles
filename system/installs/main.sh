#!/usr/bin/env bash

cd "$(dirname "${BASH_SOURCE[0]}")" \
    && . "../utils.sh"

# - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -

print_info "• Installs"

./xcode.sh
./homebrew.sh
./brew.sh
./zsh.sh
./../create_symlinks.sh
./mise.sh
./cleanup.sh

print_success "macOS installs complete"
