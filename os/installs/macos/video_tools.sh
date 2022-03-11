#!/bin/sh

cd "$(dirname "${BASH_SOURCE[0]}")" \
    && . "../../utils.sh" \
    && . "./utils.sh"

# - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -

print_info "• Video Tools"

brew_install "FFmpeg" "ffmpeg"
brew_install "yt-dlp" "yt-dlp"

print_success "Video Tools Installed"
