#!/usr/bin/env bash

cd "$(dirname "${BASH_SOURCE[0]}")" \
    && . "../utils.sh"

# - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -

print_info "• Software Update"

# softwareupdated reads the root-owned file in /Library, not the user domain.
execute "sudo defaults write /Library/Preferences/com.apple.SoftwareUpdate AutomaticCheckEnabled -bool true && \
         sudo defaults write /Library/Preferences/com.apple.SoftwareUpdate AutomaticDownload -bool true" \
    "Check for and download updates automatically"

execute "sudo defaults write /Library/Preferences/com.apple.SoftwareUpdate CriticalUpdateInstall -bool true && \
         sudo defaults write /Library/Preferences/com.apple.SoftwareUpdate ConfigDataInstall -bool true" \
    "Install security responses and system data files automatically"
