#!/usr/bin/env bash

cd "$(dirname "${BASH_SOURCE[0]}")" \
    && . "../utils.sh"

# - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -

amm_version="v1.1.0"

if [ -d "/Applications/amm.app" ]; then
    print_info "amm already installed => skipping"
else
    print_info "• Automatic Mouse Mover"
    downloadURL=$(curl -s https://api.github.com/repos/prashantgupta24/automatic-mouse-mover/releases/latest \
            | grep 'amm.app.zip' \
            | cut -d : -f 2,3 \
            | tr -d \" \
            | wget -O /tmp/amm.zip -qi -)
    execute "$downloadURL" \
        "Downloading amm"
    execute "unzip /tmp/amm.zip -d /Applications/" \
        "Installing amm"
fi
