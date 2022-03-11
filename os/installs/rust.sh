#!/bin/sh

cd "$(dirname "${BASH_SOURCE[0]}")" \
    && . "../utils.sh"

# - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -

print_info "• Rust"

if type rustc >/dev/null 2>&1; then
  print_info "Rust already installed => skipping"
else
  print_info "Installing Rust"
  curl --proto '=https' --tlsv1.2 -sSf https://sh.rustup.rs | sh
  rustc --version
fi

print_success "Rust installed"
