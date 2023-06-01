#!/usr/bin/env bash

cd "$(dirname "${BASH_SOURCE[0]}")" \
    && . "../utils.sh"

# - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -

export PATH="~/.asdf/bin:$PATH"

nodejs_version="18.16.0"

print_info "• Node.js"

if ! asdf plugin list | grep -q nodejs; then
    execute "~/.asdf/bin/asdf plugin-add nodejs" \
        "Add nodejs plugin"
fi

if ! asdf current nodejs | grep -q $nodejs_version; then
    execute "~/.asdf/bin/asdf install nodejs ${nodejs_version}" \
        "Install nodejs ${nodejs_version}"
fi

execute "~/.asdf/bin/asdf global nodejs '${nodejs_version}'" \
    "Set nodejs ${nodejs_version} as global default"
