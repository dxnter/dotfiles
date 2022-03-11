#!/bin/bash

cd "$(dirname "${BASH_SOURCE[0]}")" \
    && . "../../utils.sh"

# - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -

print_info "• Dock"

execute "defaults write com.apple.dock autohide -bool true" \
    "Automatically hide/show the Dock"

execute "defaults write com.apple.dock autohide-delay -float 0" \
    "Disable the hide Dock delay"

execute "defaults write com.apple.dock enable-spring-load-actions-on-all-items -bool true" \
    "Enable spring loading for all Dock items"

execute "defaults write com.apple.dock expose-animation-duration -float 0.1" \
    "Make all Mission Control related animations faster."

execute "defaults write com.apple.dock showLaunchpadGestureEnabled -int 0" \
    "Disable the Launchpad gesture"

execute "defaults write com.apple.dashboard mcx-disabled -bool true" \
    "Disable Dashboard"

execute "defaults write com.apple.dock expose-group-by-app -bool false" \
    "Do not group windows by application in Mission Control"

execute "defaults write com.apple.dock launchanim -bool false" \
    "Disable the opening of an application from the Dock animations."

execute "defaults write com.apple.dock autohide-time-modifier -float 0" \
    "Disable the auto-hiding Dock delay"

execute "defaults write com.apple.dock mineffect -string 'scale'" \
    "Change minimize/maximize window effect"

execute "defaults write com.apple.dock minimize-to-application -bool true" \
    "Reduce clutter by minimizing windows into their application icons"

execute "defaults write com.apple.dock mru-spaces -bool true" \
    "Automatically rearrange spaces based on most recent use"

execute "defaults write com.apple.dock persistent-apps -array && \
         defaults write com.apple.dock persistent-others -array " \
    "Wipe all app icons"

execute "defaults write com.apple.dock show-process-indicators -bool true" \
    "Show indicator lights for open applications"

execute "defaults write com.apple.dock show-recents -bool false" \
    "Do not show recent applications in Dock"

execute "defaults write com.apple.dock showhidden -bool true" \
    "Make icons of hidden applications translucent"

execute "defaults write com.apple.dock tilesize -int 48" \
    "Set icon size"

execute "defaults write com.apple.dock wvous-tr-corner -int 0" \
    "Disable top right hot corner"

execute "defaults write com.apple.dock wvous-tl-corner -int 0" \
    "Disable top left hot corner"

execute "defaults write com.apple.dock wvous-bl-corner -int 0" \
    "Disable bottom left hot corner"

execute "defaults write com.apple.dock wvous-br-corner -int 0" \
    "Disable bottom right hot corner"

killall "Dock" &> /dev/null
