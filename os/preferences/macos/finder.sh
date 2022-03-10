#!/usr/bin/env bash

cd "$(dirname "${BASH_SOURCE[0]}")" \
    && . "../../utils.sh"

# - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -

print_info "• Finder"

execute "chflags nohidden ~/Library" \
    "Show the ~/Library folder"

execute "sudo chflags nohidden /Volumes" \
    "Show the /Volumes folder"

defaults write com.apple.finder FXInfoPanesExpanded -dict \
    	General -bool true \
    	OpenWith -bool true \
    	Privileges -bool true

execute "defaults write com.apple.frameworks.diskimages auto-open-ro-root -bool true && \
         defaults write com.apple.frameworks.diskimages auto-open-rw-root -bool true && \
         defaults write com.apple.finder OpenWindowForNewRemovableDisk -bool true" \
    "Automatically open a new Finder window when a volume is mounted"

execute "defaults write com.apple.LaunchServices LSQuarantine -bool false" \
    "Disable application dialog warnings"

execute "defaults write com.apple.finder _FXShowPosixPathInTitle -bool true" \
    "Use full POSIX path as window title"

execute "defaults write com.apple.finder _FXSortFoldersFirst -bool true" \
    "Keep folders on top of the other items"

execute "defaults write com.apple.finder DisableAllAnimations -bool true" \
    "Disable all animations"

execute "defaults write NSGlobalDomain com.apple.springing.enabled -bool true" \
    "Enable spring loading for all Dock items"

execute "defaults write NSGlobalDomain com.apple.springing.delay -float 0" \
    "Remove the spring loading delay for all Dock items"

execute "defaults write com.apple.finder WarnOnEmptyTrash -bool false" \
    "Disable the warning before emptying the Trash"

execute "defaults write com.apple.finder FXDefaultSearchScope -string 'SCcf'" \
    "Search the current directory by default"

execute "defaults write com.apple.finder FXEnableExtensionChangeWarning -bool false" \
    "Disable warning when changing a file extension"

execute "defaults write com.apple.finder FXPreferredViewStyle -string 'Nlsv'" \
    "Use list view in all Finder windows by default"

execute "defaults write com.apple.finder NewWindowTarget -string 'PfHm' && \
         defaults write com.apple.finder NewWindowTargetPath -string 'file://$HOME/'" \
    "Set 'Home' as the default location for new Finder windows"

execute "defaults write com.apple.finder ShowExternalHardDrivesOnDesktop -bool true && \
         defaults write com.apple.finder ShowHardDrivesOnDesktop -bool true && \
         defaults write com.apple.finder ShowMountedServersOnDesktop -bool true && \
         defaults write com.apple.finder ShowRemovableMediaOnDesktop -bool true" \
    "Show icons for hard drives, servers, and removable media on the desktop"

execute "defaults write com.apple.finder ShowRecentTags -bool false" \
    "Do not show recent tags"

execute "defaults write com.apple.finder ShowPathbar -bool true" \
    "Show path bar"

execute "defaults write com.apple.finder ShowStatusBar -bool false" \
    "Do not show status bar"

execute "defaults write -g AppleShowAllExtensions -bool true" \
    "Show all filename extensions"

execute "defaults write com.apple.finder AppleShowAllFiles -bool true" \
    "Show hidden files and folders"

execute "defaults write com.apple.desktopservices DSDontWriteNetworkStores -bool true" \
    "Avoid creating .DS_Store files on network volumes"

execute "defaults write com.apple.desktopservices DSDontWriteUSBStores -bool true" \
    "Avoid creating .DS_Store files on USB volumes"

execute "defaults write com.apple.NetworkBrowser BrowseAllInterfaces -bool true" \
    "Enable AirDrop over Ethernet"

execute "defaults write com.apple.frameworks.diskimages skip-verify -bool true" \
    "Disable disk image verification"

execute "defaults write com.apple.frameworks.diskimages skip-verify-locked -bool true" \
    "Disable disk image verification locked"

execute "defaults write com.apple.frameworks.diskimages skip-verify-remote -bool true" \
    "Disable disk image verification remote"

execute "defaults write com.apple.frameworks.diskimages auto-open-ro-root -bool true" \
    "Automatically open a new Finder window when a volume is mounted"

execute "defaults write com.apple.frameworks.diskimages auto-open-rw-root -bool true" \
    "Automatically open a new Finder window when a volume is mounted"

execute "defaults write com.apple.finder OpenWindowForNewRemovableDisk -bool true" \
    "Automatically open a new Finder window when a volume is mounted"

execute "/usr/libexec/PlistBuddy -c 'Set :DesktopViewSettings:IconViewSettings:iconSize 72' ~/Library/Preferences/com.apple.finder.plist && \
         /usr/libexec/PlistBuddy -c 'Set :StandardViewSettings:IconViewSettings:iconSize 72' ~/Library/Preferences/com.apple.finder.plist" \
    "Set icon size"

execute "/usr/libexec/PlistBuddy -c 'Set :DesktopViewSettings:IconViewSettings:gridSpacing 10' ~/Library/Preferences/com.apple.finder.plist && \
         /usr/libexec/PlistBuddy -c 'Set :StandardViewSettings:IconViewSettings:gridSpacing 10' ~/Library/Preferences/com.apple.finder.plist" \
    "Set icon grid spacing size"

execute "/usr/libexec/PlistBuddy -c 'Set :DesktopViewSettings:IconViewSettings:textSize 13' ~/Library/Preferences/com.apple.finder.plist && \
         /usr/libexec/PlistBuddy -c 'Set :StandardViewSettings:IconViewSettings:textSize 13' ~/Library/Preferences/com.apple.finder.plist" \
    "Set icon label text size"

execute "/usr/libexec/PlistBuddy -c 'Set :DesktopViewSettings:IconViewSettings:labelOnBottom true' ~/Library/Preferences/com.apple.finder.plist && \
         /usr/libexec/PlistBuddy -c 'Set :StandardViewSettings:IconViewSettings:labelOnBottom true' ~/Library/Preferences/com.apple.finder.plist" \
    "Set icon label position"

execute "/usr/libexec/PlistBuddy -c 'Set :DesktopViewSettings:IconViewSettings:showItemInfo true' ~/Library/Preferences/com.apple.finder.plist && \
         /usr/libexec/PlistBuddy -c 'Set :StandardViewSettings:IconViewSettings:showItemInfo true' ~/Library/Preferences/com.apple.finder.plist" \
    "Show item info"

execute "/usr/libexec/PlistBuddy -c 'Set :DesktopViewSettings:IconViewSettings:arrangeBy grid' ~/Library/Preferences/com.apple.finder.plist && \
         /usr/libexec/PlistBuddy -c 'Set :StandardViewSettings:IconViewSettings:arrangeBy grid' ~/Library/Preferences/com.apple.finder.plist" \
    "Set sort method"

killall "Finder" &> /dev/null

killall "cfprefsd" &> /dev/null
