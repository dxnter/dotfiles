#!/usr/bin/env bash

cd "$(dirname "${BASH_SOURCE[0]}")" \
    && . "../utils.sh"

# - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -

print_info "• Firewall"

# com.apple.alf stopped working in macOS 15; socketfilterfw works on 13 through 26.
execute "sudo /usr/libexec/ApplicationFirewall/socketfilterfw --setglobalstate on && \
         sudo /usr/libexec/ApplicationFirewall/socketfilterfw --setstealthmode on" \
    "Enable firewall and stealth mode"

execute "sudo /usr/libexec/ApplicationFirewall/socketfilterfw --setallowsignedapp off" \
    "Disable automatic downloaded software from receiving incoming connections"
