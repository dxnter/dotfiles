#!/usr/bin/env bash

cd "$(dirname "${BASH_SOURCE[0]}")" \
    && . "../utils.sh"

# - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -

print_info "• Privacy & Security"

execute "echo '127.0.0.1 ocsp.apple.com' | sudo tee -a /etc/hosts" \
    "Block application launch information from being sent to Apple"

execute "defaults write /Library/Preferences/com.apple.alf globalstate -int 1 && \
         defaults write /Library/Preferences/com.apple.alf stealthenabled -int 1 && \
         defaults write /Library/Preferences/com.apple.alf loggingenabled -int 1" \
    "Enable firewall, stealth mode, and logging"
