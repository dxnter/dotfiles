#!/usr/bin/env bash

cd "$(dirname "${BASH_SOURCE[0]}")" \
    && . "../utils.sh"

# - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -

print_info "• Installs"

./xcode.sh
./homebrew.sh
./zsh.sh
./git.sh
./gpg.sh

./cli_tools.sh

ask_for_confirmation "Do you want to install CTF tools? (nmap, hydra, john, etc.) \n"
if answer_is_yes; then
    ./ctf_tools.sh
fi

./../create_symlinks.sh
./asdf.sh
./nodejs.sh
./poetry.sh
./rust.sh
./nvim.sh
./go.sh
./dev_tools.sh

./media_tools.sh
./browsers.sh
./amm.sh
./fonts.sh
./misc.sh

./cleanup.sh

print_success "macOS installs complete"
