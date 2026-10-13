#!/usr/bin/env bash

cd "$(dirname "${BASH_SOURCE[0]}")" \
    && . "../utils.sh"

# - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -

print_info "• UI & UX"

execute "defaults write com.apple.desktopservices DSDontWriteNetworkStores -bool true" \
    "Avoid creating '.DS_Store' files on network volumes"

execute "defaults write com.apple.CrashReporter UseUNC -bool true" \
    "Make crash reports appear as notifications"

execute "defaults write com.apple.screencapture disable-shadow -bool true" \
    "Disable shadow in screenshots"

execute "mkdir -p '$HOME/Documents/screenshots' && \
         defaults write com.apple.screencapture location -string '$HOME/Documents/screenshots'" \
    "Save screenshots to Documents/screenshots"

execute "defaults write com.apple.TimeMachine DoNotOfferNewDisksForBackup -bool true" \
    "Disable Time Machine new disk creation warnings"

execute "defaults write -g AppleFontSmoothing -int 2" \
    "Use strong font smoothing"

execute "defaults write -g AppleShowScrollBars -string 'Always'" \
    "Always show scrollbars"

execute "defaults write -g NSAutomaticWindowAnimationsEnabled -bool false" \
    "Disable window opening and closing animations."

execute "defaults write -g NSDisableAutomaticTermination -bool true" \
    "Disable automatic termination of inactive apps"

execute "defaults write -g NSNavPanelExpandedStateForSaveMode -bool true" \
    "Expand save panel by default"

execute "defaults write -g NSTableViewDefaultSizeMode -int 2" \
    "Set sidebar icon size to medium"

execute "defaults write -g NSUseAnimatedFocusRing -bool false" \
    "Disable the over-the-top focus ring animation"

execute "defaults write -g NSWindowResizeTime -float 0.001" \
    "Accelerated playback when adjusting the window size."

execute "defaults write -g PMPrintingExpandedStateForPrint -bool true" \
    "Expand print panel by default"

execute "defaults write -g QLPanelAnimationDuration -float 0" \
    "Disable opening a Quick Look window animations."

execute "defaults write -g WebKitDeveloperExtras -bool true" \
    "Add a context menu item for showing the 'Web Inspector' in web views"

execute "defaults write -g NSQuitAlwaysKeepsWindows -bool false" \
    "Don't reopen windows when apps relaunch"

# Sonoma and Sequoia features; macOS 13 ignores these keys.
execute "defaults write com.apple.WindowManager EnableStandardClickToShowDesktop -bool false" \
    "Don't reveal the desktop when clicking the wallpaper"

execute "defaults write com.apple.WindowManager EnableTiledWindowMargins -bool false" \
    "Remove the gaps between tiled windows"

execute "sudo defaults write /Library/Preferences/com.apple.loginwindow AdminHostInfo HostName" \
    "Reveal IP address, hostname, OS version, etc. when clicking the clock in the login window"

killall "WindowManager" &> /dev/null
