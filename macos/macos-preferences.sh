#!/usr/bin/env bash
source './shared/utils.sh'

macos_prefs() {
    osascript -e 'tell application "System Preferences" to quit'

    # Ask for the administrator password upfront
    sudo -v

    # Keep-alive: update existing `sudo` time stamp until `.macos` has finished
    while true; do sudo -n true; sleep 60; kill -0 "$$" || exit; done 2>/dev/null &

    # Disable the sound effects on boot
    sudo nvram SystemAudioVolume=" "
    print_success "Boot sound effect disabled"

    # Always show scrollbars
    defaults write NSGlobalDomain AppleShowScrollBars -string "Always"

    # Disable the over-the-top focus ring animation
    defaults write NSGlobalDomain NSUseAnimatedFocusRing -bool false

    ###############################################################################
    # General UI/UX                                                               #
    ###############################################################################

    # Save to disk (not to iCloud) by default
    defaults write NSGlobalDomain NSDocumentSaveNewDocumentsToCloud -bool false

    # Automatically quit printer app once the print jobs complete
    defaults write com.apple.print.PrintingPrefs "Quit When Finished" -bool true

    # Reveal IP address, hostname, OS version, etc. when clicking the clock
    # in the login window
    sudo defaults write /Library/Preferences/com.apple.loginwindow AdminHostInfo HostName

    # Disable automatic period substitution as it’s annoying when typing code
    defaults write NSGlobalDomain NSAutomaticPeriodSubstitutionEnabled -bool false

    # Show date, day of the week and format clock in menu bar.
    defaults write com.apple.menuextra.clock "DateFormat" "EEE d MMM  hh:mm:ss"

    # Show seconds in the clock.
    defaults write com.apple.menuextra.clock ShowSeconds -bool true

    # Disable automatic termination of inactive apps
    defaults write NSGlobalDomain NSDisableAutomaticTermination -bool true

    ###############################################################################
    # Trackpad, mouse, keyboard, Bluetooth accessories, and input                 #
    ###############################################################################

    # Disable “natural” scrolling
    defaults write NSGlobalDomain com.apple.swipescrolldirection -bool false

    # Disable mouse scaling
    defaults write .GlobalPreferences com.apple.mouse.scaling -1

    # Increase sound quality for Bluetooth headphones/headsets
    defaults write com.apple.BluetoothAudioAgent "Apple Bitpool Min (editable)" -int 40

    ###############################################################################
    # Screen                                                                      #
    ###############################################################################

    # Require password immediately after sleep or screen saver begins
    defaults write com.apple.screensaver askForPassword -int 1
    defaults write com.apple.screensaver askForPasswordDelay -int 0

    # Save screenshots to the desktop
    defaults write com.apple.screencapture location -string "${HOME}/Documents/screenshots"

    # Save screenshots in PNG format (other options: BMP, GIF, JPG, PDF, TIFF)
    defaults write com.apple.screencapture type -string "png"

    # Disable shadow in screenshots
    defaults write com.apple.screencapture disable-shadow -bool true

    # Enable subpixel font rendering on non-Apple LCDs
    # Reference: https://github.com/kevinSuttle/macOS-Defaults/issues/17#issuecomment-266633501
    defaults write -g CGFontRenderingFontSmoothingDisabled -bool NO
    defaults write NSGlobalDomain AppleFontSmoothing -int 2

    # Enable HiDPI display modes (requires restart)
    sudo defaults write /Library/Preferences/com.apple.windowserver DisplayResolutionEnabled -bool true

    ###############################################################################
    # Mail                                                                        #
    ###############################################################################

    # Disable send and reply animations in Mail.app
    defaults write com.apple.mail DisableReplyAnimations -bool true
    defaults write com.apple.mail DisableSendAnimations -bool true

    # Copy email addresses as `foo@example.com` instead of `Foo Bar <foo@example.com>` in Mail.app
    defaults write com.apple.mail AddressesIncludeNameOnPasteboard -bool false

    # Add the keyboard shortcut ⌘ + Enter to send an email in Mail.app
    defaults write com.apple.mail NSUserKeyEquivalents -dict-add "Send" "@\U21a9"

    # Display emails in threaded mode, sorted by date (oldest at the top)
    defaults write com.apple.mail DraftsViewerAttributes -dict-add "DisplayInThreadedMode" -string "yes"
    defaults write com.apple.mail DraftsViewerAttributes -dict-add "SortedDescending" -string "yes"
    defaults write com.apple.mail DraftsViewerAttributes -dict-add "SortOrder" -string "received-date"

    ###############################################################################
    # Time Machine                                                                #
    ###############################################################################

    # Prevent Time Machine from prompting to use new hard drives as backup volume
    defaults write com.apple.TimeMachine DoNotOfferNewDisksForBackup -bool true

    # Disable local Time Machine backups
    hash tmutil &> /dev/null && sudo tmutil disable

    ###############################################################################
    # Activity Monitor                                                            #
    ###############################################################################

    # Show the main window when launching Activity Monitor
    defaults write com.apple.ActivityMonitor OpenMainWindow -bool true

    # Visualize CPU usage in the Activity Monitor Dock icon
    defaults write com.apple.ActivityMonitor IconType -int 5

    # Show all processes in Activity Monitor
    defaults write com.apple.ActivityMonitor ShowCategory -int 0

    # Sort Activity Monitor results by CPU usage
    defaults write com.apple.ActivityMonitor SortColumn -string "CPUUsage"
    defaults write com.apple.ActivityMonitor SortDirection -int 0

    ###############################################################################
    # Address Book, Dashboard, iCal, TextEdit, and Disk Utility                   #
    ###############################################################################

    # Enable the debug menu in Address Book
    defaults write com.apple.addressbook ABShowDebugMenu -bool true

    # Enable Dashboard dev mode (allows keeping widgets on the desktop)
    defaults write com.apple.dashboard devmode -bool true

    # Use plain text mode for new TextEdit documents
    defaults write com.apple.TextEdit RichText -int 0
    # Open and save files as UTF-8 in TextEdit
    defaults write com.apple.TextEdit PlainTextEncoding -int 4
    defaults write com.apple.TextEdit PlainTextEncodingForWrite -int 4

    # Enable the debug menu in Disk Utility
    defaults write com.apple.DiskUtility DUDebugMenuEnabled -bool true
    defaults write com.apple.DiskUtility advanced-image-options -bool true

    ###############################################################################
    # Photos                                                                      #
    ###############################################################################

    # Prevent Photos from opening automatically when devices are plugged in
    defaults -currentHost write com.apple.ImageCapture disableHotPlug -bool true

    ###############################################################################
    # Messages                                                                    #
    ###############################################################################

    # Disable smart quotes as it’s annoying for messages that contain code
    defaults write com.apple.messageshelper.MessageController SOInputLineSettings -dict-add "automaticQuoteSubstitutionEnabled" -bool false


}

macos_prefs
