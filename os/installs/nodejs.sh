#!/bin/sh

cd "$(dirname "${BASH_SOURCE[0]}")" \
    && . "../utils.sh"

# - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -

nodejs_version="16.13.2"

print_info "• Node.js"

asdf plugin add nodejs
bash -c '${ASDF_DATA_DIR:=$HOME/.asdf}/plugins/nodejs/bin/import-release-team-keyring'
asdf install nodejs "${nodejs_version}"
asdf global nodejs "${nodejs_version}"

print_success "Node.js ${nodejs_version} installed"
