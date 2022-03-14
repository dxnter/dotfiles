#!/usr/bin/env bash

cd "$(dirname "${BASH_SOURCE[0]}")" \
    && . "../utils.sh"

# - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -

print_info "• Rust"

if type rustc >/dev/null 2>&1; then
  print_info "Rust already installed => skipping"
else
  execute \
    "curl https://sh.rustup.rs -sSf | sh -s -- -y" \
    "Rust"
fi

print_success "Rust installed"
