#!/bin/sh

cd "$(dirname "${BASH_SOURCE[0]}")" \
    && . "../utils.sh"

# - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -

print_info "• asdf"

asdf_version="0.9.0"
asdf_home="$HOME/.asdf"

if [ ! -d "${asdf_home}" ]; then
  print_info "Installing asdf"
  git clone https://github.com/asdf-vm/asdf.git ~/.asdf --branch "v${asdf_version}"
else
  print_info "asdf already installed => skipping"
fi

print_success "asdf installed"
