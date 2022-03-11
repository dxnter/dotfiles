#!/bin/bash

cd "$(dirname "${BASH_SOURCE[0]}")" \
    && . "../../utils.sh"

# - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -

print_info "• Mail"

execute "defaults write com.apple.mail DisableReplyAnimations -bool true && \
         defaults write com.apple.mail DisableSendAnimations -bool true" \
    "Disable send and reply animations in Mail.app"

execute "defaults write com.apple.mail AddressesIncludeNameOnPasteboard -bool false" \
    "Copy email addresses as `foo@example.com` instead of `Foo Bar <foo@example.com>` in Mail.app"

execute "defaults write com.apple.mail NSUserKeyEquivalents -dict-add 'Send' '@\U21a9'" \
    "Use `⌘ + Enter` to send an email in Mail.app"

execute "defaults write com.apple.mail DraftsViewerAttributes -dict-add 'DisplayInThreadedMode' -string 'yes' && \
         defaults write com.apple.mail DraftsViewerAttributes -dict-add 'SortedDescending' -string && \
         defaults write com.apple.mail DraftsViewerAttributes -dict-add 'SortOrder' -string 'received-date'" \
    "Display emails in threaded mode, sorted by date received (newest first)"


killall "Mail" &> /dev/null
