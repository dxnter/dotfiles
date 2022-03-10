#!/bin/bash

cd "$(dirname "${BASH_SOURCE[0]}")" \
    && . "../../utils.sh" \
    && . "./utils.sh"

# - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -

print_in_purple "\n   Hack fonts\n\n"

git clone https://github.com/ryanoasis/nerd-fonts --depth 1 /tmp/nerd-fonts
pushd /tmp/nerd-fonts && ./install.sh Hack && popd
