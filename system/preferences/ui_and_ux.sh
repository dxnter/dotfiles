#!/usr/bin/env bash

cd "$(dirname "${BASH_SOURCE[0]}")" \
    && . "../utils.sh"

# - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -

print_info "• UI & UX"

execute "defaults write com.apple.desktopservices DSDontWriteNetworkStores -bool true && \
         defaults write com.apple.desktopservices DSDontWriteUSBStores -bool true" \
   "Avoid creating '.DS_Store' files on network or USB volumes"

execute "defaults write com.apple.BluetoothAudioAgent 'Apple Bitpool Max (editable)' 80 && \
        defaults write com.apple.BluetoothAudioAgent 'Apple Bitpool Min (editable)' 80 && \
        defaults write com.apple.BluetoothAudioAgent 'Apple Initial Bitpool (editable)' 80 && \
        defaults write com.apple.BluetoothAudioAgent 'Apple Initial Bitpool Min (editable)' 80 && \
        defaults write com.apple.BluetoothAudioAgent 'Negotiated Bitpool' 80 && \
        defaults write com.apple.BluetoothAudioAgent 'Negotiated Bitpool Max' 80 && \
        defaults write com.apple.BluetoothAudioAgent 'Negotiated Bitpool Min' 80" \
    "Increase sound quality for Bluetooth headphones/headsets"

execute "defaults write com.apple.CrashReporter UseUNC 1" \
    "Make crash reports appear as notifications"

execute "defaults write com.apple.LaunchServices LSQuarantine -bool false" \
    "Disable 'Are you sure you want to open this application?' dialog"

execute "defaults write com.apple.print.PrintingPrefs 'Quit When Finished' -bool true" \
    "Automatically quit the printer app once the print jobs are completed"

execute "defaults write com.apple.screencapture disable-shadow -bool true" \
    "Disable shadow in screenshots"

execute "defaults write com.apple.screencapture location -string '$HOME/Documents/screenshots'" \
    "Save screenshots to Documents/screenshots"

execute "defaults write com.apple.screencapture show-thumbnail -bool true" \
    "Show thumbnail image for screen captures"

execute "defaults write com.apple.TimeMachine DoNotOfferNewDisksForBackup -bool true" \
    "Disable Time Machine new disk creation warnings"

execute "defaults write com.apple.screencapture type -string 'png'" \
    "Save screenshots as PNGs"

execute "defaults write com.apple.screensaver askForPassword -int 1 && \
         defaults write com.apple.screensaver askForPasswordDelay -int 0"\
    "Require password immediately after into sleep or screen saver mode"

execute "defaults write -g CGFontRenderingFontSmoothingDisabled -bool NO" \
    "Enable subpixel font rendering on non-Apple LCDs"

execute "defaults write -g AppleFontSmoothing -int 2" \
    "Enable subpixel font rendering on non-Apple LCDs"

execute "sudo defaults write /Library/Preferences/com.apple.windowserver DisplayResolutionEnabled -bool true" \
    "Enable HiDPI display modes (requires restart)"

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

execute "defaults write com.apple.BluetoothAudioAgent 'Apple Bitpool Min (editable)' -int 40" \
    "Set Bluetooth audio agent bitpool min size to 40"

execute "defaults write -g PMPrintingExpandedStateForPrint -bool true" \
    "Expand print panel by default"

execute "defaults write -g QLPanelAnimationDuration -float 0" \
    "Disable opening a Quick Look window animations."

execute "defaults write com.apple.systempreferences NSQuitAlwaysKeepsWindows -bool false" \
    "Disable resume system-wide"

execute "sudo defaults write /Library/Preferences/com.apple.loginwindow AdminHostInfo HostName" \
    "Reveal IP address, hostname, OS version, etc. when clicking the clock in the login window"

execute "defaults write com.apple.menuextra.clock 'DateFormat' 'EEE d MMM  hh:mm a'" \
    "Set date format"

execute "defaults write .GlobalPreferences com.apple.mouse.scaling -1" \
    "Disable “natural” (Lion-style) scrolling"

execute "sudo systemsetup -setrestartfreeze on" \
    "Restart automatically if the computer freezes"

execute "for domain in ~/Library/Preferences/ByHost/com.apple.systemuiserver.*; do
            sudo defaults write \"\${domain}\" dontAutoLoad -array \
                '/System/Library/CoreServices/Menu Extras/TimeMachine.menu' \
                '/System/Library/CoreServices/Menu Extras/Volume.menu'
         done \
            && sudo defaults write com.apple.systemuiserver menuExtras -array \
                '/System/Library/CoreServices/Menu Extras/Bluetooth.menu' \
                '/System/Library/CoreServices/Menu Extras/AirPort.menu' \
                '/System/Library/CoreServices/Menu Extras/Battery.menu' \
                '/System/Library/CoreServices/Menu Extras/Clock.menu'
        " \
    "Hide Time Machine and Volume icons from the menu bar"

killall "SystemUIServer" &> /dev/null
