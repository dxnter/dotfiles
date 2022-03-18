#!/usr/bin/env bash

cd "$(dirname "${BASH_SOURCE[0]}")" \
    && . "../utils.sh"

# - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -

nodejs_version="16.13.2"

print_info "• Node.js"

~/.asdf/bin/asdf plugin remove nodejs
~/.asdf/bin/asdf plugin add nodejs https://github.com/asdf-vm/asdf-nodejs.git
~/.asdf/bin/asdf install nodejs "${nodejs_version}"
~/.asdf/bin/asdf global nodejs "${nodejs_version}"

print_success "Node.js ${nodejs_version} installed"
