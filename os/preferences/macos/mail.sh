#!/usr/bin/env bash

cd "$(dirname "${BASH_SOURCE[0]}")" \
    && . "../../utils.sh"

# - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -

print_info "• Mail"

execute "defaults write com.apple.mail DisableReplyAnimations -bool true && \
         defaults write com.apple.mail DisableSendAnimations -bool true" \
    "Disable send and reply animations in Mail.app"

execute "defaults write com.apple.mail AddressesIncludeNameOnPasteboard -bool false" \
    "Copy email addresses without real names to the clipboard"

execute "defaults write com.apple.mail NSUserKeyEquivalents -dict-add 'Send' '@\U21a9'" \
    "Use 'Command + Enter' to send an email in Mail.app"

killall "Mail" &> /dev/null
