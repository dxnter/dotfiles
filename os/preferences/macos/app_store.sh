#!/usr/bin/env bash

cd "$(dirname "${BASH_SOURCE[0]}")" \
    && . "../../utils.sh"

# - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -

print_info "• App Store"

execute "defaults write com.apple.appstore WebKitDeveloperExtras -bool true" \
    "Enable the WebKit Developer Tools"

execute "defaults write com.apple.appstore ShowDebugMenu -bool true" \
    "Enable debug menu"

execute "defaults write com.apple.commerce AutoUpdate -bool true" \
    "Turn on auto-update"

execute "defaults write com.apple.SoftwareUpdate AutomaticCheckEnabled -bool true" \
    "Enable automatic update check"

execute "defaults write com.apple.SoftwareUpdate AutomaticDownload -int 1" \
    "Download newly available updates in background"

execute "defaults write com.apple.SoftwareUpdate ScheduleFrequency -int 1" \
    "Check for software updates daily"

execute "defaults write com.apple.SoftwareUpdate CriticalUpdateInstall -int 1" \
    "Install System data files and security updates"

execute "defaults write com.apple.commerce AutoUpdateRestartRequired -bool true" \
    "Restart to install updates"

killall "App Store" &> /dev/null
