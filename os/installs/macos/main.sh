#!/usr/bin/env bash

cd "$(dirname "${BASH_SOURCE[0]}")" \
    && . "../../utils.sh" \
    && . "./utils.sh"

# - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -

./xcode.sh
./homebrew.sh
./zsh.sh

./git.sh
./browsers.sh
./cli_tools.sh
./../asdf.sh
./ctf_tools.sh
./dev_tools.sh
./gpg.sh
./misc.sh
./tmux.sh
./video_tools.sh
./fonts.sh

./cleanup.sh

print_success "macOS installs complete"
