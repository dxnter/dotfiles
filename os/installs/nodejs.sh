#!/usr/bin/env bash

cd "$(dirname "${BASH_SOURCE[0]}")" \
    && . "../utils.sh"

# - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -

nodejs_version="16.13.2"

print_info "• Node.js"

asdf plugin remove nodejs
asdf plugin add nodejs https://github.com/asdf-vm/asdf-nodejs.git
asdf install nodejs "${nodejs_version}"
asdf global nodejs "${nodejs_version}"

print_success "Node.js ${nodejs_version} installed"
