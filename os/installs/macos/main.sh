#!/usr/bin/env bash

cd "$(dirname "${BASH_SOURCE[0]}")" \
    && . "../../utils.sh" \
    && . "./utils.sh"

# - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -

./xcode.sh
./homebrew.sh
./zsh.sh
./git.sh
./gpg.sh

./cli_tools.sh
./ctf_tools.sh

./../rust.sh

./../asdf.sh
./../python.sh
./../node.sh


./../poetry.sh

./dev_tools.sh


./video_tools.sh
./browsers.sh
./fonts.sh
./misc.sh

./cleanup.sh

print_success "macOS installs complete"
