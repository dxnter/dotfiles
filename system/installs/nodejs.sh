#!/usr/bin/env bash

cd "$(dirname "${BASH_SOURCE[0]}")" \
    && . "../utils.sh"

# - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -

nodejs_version="16.13.2"

print_info "• Node.js"

execute "~/.asdf/bin/asdf update" \
    "Update asdf"

execute "~/.asdf/bin/asdf plugin remove nodejs" \
    "Remove nodejs plugin if it exists"

execute "~/.asdf/bin/asdf plugin add nodejs https://github.com/asdf-vm/asdf-nodejs.git" \
    "Add nodejs plugin"

execute "~/.asdf/bin/asdf install nodejs '${nodejs_version}'" \
    "Install nodejs ${nodejs_version}"

execute "~/.asdf/bin/asdf global nodejs '${nodejs_version}'" \
    "Set nodejs ${nodejs_version} as global default"
