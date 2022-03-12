#!/bin/bash

cd "$(dirname "${BASH_SOURCE[0]}")" \
    && . "../../utils.sh" \
    && . "./utils.sh"

# - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -

print_info "• CLI Tools"

brew_install "moreutils" "moreutils"
brew_install "findutils" "findutils"
brew_install "gnu-sed" "gnu-sed"
brew_install "cmake" "cmake"
brew_install "make" "make"
brew_install "openssl" "openssl"
brew_install "readline" "readline"
brew_install "sqlite3" "sqlite3"
brew_install "xz" "xz"
brew_install "zlib" "zlib"
brew_install "gpac" "gpac"
brew_install "curl" "curl"
brew_install "wget" "wget"
brew_install "tree" "tree"
brew_install "jq" "jq"
brew_install "fd" "fd"
brew_install "fzf" "fzf"
brew_install "lsd" "lsd"
brew_install "bat" "bat"
brew_install "delta" "git-delta"
brew_install "gpatch" "gpatch"
brew_install "mas" "mas"
brew_install "ag" "ag"
brew_install "pandoc" "pandoc"
brew_install "ripgrep" "ripgrep"
brew_install "stow" "stow"
brew_install "tldr" "tldr"
brew_install "neofetch" "neofetch"
brew_install "tmux" "tmux"
brew_install "tmux (pasteboard)" "reattach-to-user-namespace"
brew_install "htop" "htop"
brew_install "ctop" "ctop"
brew_install "grip" "grip"
