#!/bin/bash

cd "$(dirname "${BASH_SOURCE[0]}")" \
    && . "../../utils.sh" \
    && . "./utils.sh"

# - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -

./xcode.sh
./homebrew.sh

# TODO: Change to zsh script
./bash.sh

./git.sh
./browsers.sh
./gpg.sh
./misc.sh
./tmux.sh
./video_tools.sh
./../vim.sh
./dev_tools.sh
./fonts.sh
