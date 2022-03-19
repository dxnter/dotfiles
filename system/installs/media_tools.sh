#!/usr/bin/env bash

cd "$(dirname "${BASH_SOURCE[0]}")" \
    && . "../utils.sh"

# - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -

print_info "• Media Tools"

brew_install "FFmpeg" "ffmpeg"
brew_install "yt-dlp" "yt-dlp"
brew_install "VLC" "vlc" "--cask"
brew_install "Spotify" "spotify" "--cask"
