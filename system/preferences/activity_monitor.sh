#!/usr/bin/env bash

cd "$(dirname "${BASH_SOURCE[0]}")" \
    && . "../utils.sh"

# - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -

print_info "• Activity Monitor"

execute "defaults write com.apple.ActivityMonitor OpenMainWindow -bool true" \
    "Show the main window when launching Activity Monitor"

execute "defaults write com.apple.ActivityMonitor IconType -int 5" \
    "Visualize CPU usage in the Activity Monitor Dock icon"

execute "defaults write com.apple.ActivityMonitor ShowCategory -int 100" \
    "Show all processes in Activity Monitor"

killall "Activity Monitor" &> /dev/null
