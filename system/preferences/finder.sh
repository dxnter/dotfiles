#!/usr/bin/env bash

cd "$(dirname "${BASH_SOURCE[0]}")" \
    && . "../utils.sh"

# - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -

print_info "• Finder"

execute "chflags nohidden ~/Library" \
    "Show the ~/Library folder"

execute "sudo chflags nohidden /Volumes" \
    "Show the /Volumes folder"

execute "defaults write com.apple.finder FXInfoPanesExpanded -dict General -bool true OpenWith -bool true Privileges -bool true" \
    "Expand the General, Open with, and Sharing panes in Get Info"

execute "defaults write com.apple.frameworks.diskimages auto-open-ro-root -bool true && \
         defaults write com.apple.frameworks.diskimages auto-open-rw-root -bool true" \
    "Automatically open a Finder window when a disk image is mounted"

execute "defaults write com.apple.finder _FXShowPosixPathInTitle -bool true" \
    "Use full POSIX path as window title"

execute "defaults write com.apple.finder _FXSortFoldersFirst -bool true && \
         defaults write com.apple.finder _FXSortFoldersFirstOnDesktop -bool true" \
    "Keep folders on top of the other items, on the desktop too"

execute "defaults write com.apple.finder DisableAllAnimations -bool true" \
    "Disable all animations"

execute "defaults write NSGlobalDomain com.apple.springing.enabled -bool true" \
    "Enable spring-loaded folders"

execute "defaults write NSGlobalDomain com.apple.springing.delay -float 0" \
    "Remove the spring-loaded folder delay"

execute "defaults write com.apple.finder WarnOnEmptyTrash -bool false" \
    "Disable the warning before emptying the Trash"

execute "defaults write com.apple.finder FXRemoveOldTrashItems -bool true" \
    "Remove items from the Trash after 30 days"

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
         defaults write com.apple.finder ShowHardDrivesOnDesktop -bool false && \
         defaults write com.apple.finder ShowMountedServersOnDesktop -bool false && \
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

# Icon view settings live in nested dicts that a fresh account doesn't have yet,
# so create the parents and Add each key when Set fails.
set_icon_view() {
    local plist="$HOME/Library/Preferences/com.apple.finder.plist"
    local view=""

    for view in DesktopViewSettings StandardViewSettings; do
        /usr/libexec/PlistBuddy -c "Add :$view dict" "$plist" &> /dev/null
        /usr/libexec/PlistBuddy -c "Add :$view:IconViewSettings dict" "$plist" &> /dev/null
        /usr/libexec/PlistBuddy -c "Set :$view:IconViewSettings:$1 $3" "$plist" &> /dev/null \
            || /usr/libexec/PlistBuddy -c "Add :$view:IconViewSettings:$1 $2 $3" "$plist" \
            || return 1
    done
}

execute "set_icon_view iconSize integer 72" \
    "Set icon size"

execute "set_icon_view gridSpacing integer 10" \
    "Set icon grid spacing size"

execute "set_icon_view textSize integer 13" \
    "Set icon label text size"

execute "set_icon_view labelOnBottom bool true" \
    "Set icon label position"

execute "set_icon_view showItemInfo bool true" \
    "Show item info"

execute "set_icon_view arrangeBy string grid" \
    "Set sort method"

# Restart cfprefsd before Finder so Finder doesn't write its cached copy over the PlistBuddy edits.
killall "cfprefsd" &> /dev/null
killall "Finder" &> /dev/null
