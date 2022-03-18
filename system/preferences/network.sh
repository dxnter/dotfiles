#!/usr/bin/env bash

cd "$(dirname "${BASH_SOURCE[0]}")" \
    && . "../utils.sh"

# - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -

print_info "• Network"

execute "networksetup -setairportpower en0 off" \
    "Turn off network interfaces"

execute "echo '127.0.0.1 ocsp.apple.com' | sudo tee -a /etc/hosts" \
    "Block application launch information from being sent to Apple"

execute "networksetup -setdnsservers Wi-Fi 1.1.1.1 1.0.0.1 2606:4700:4700::1111 2606:4700:4700::1001" \
    "Set DNS servers to Cloudflare"

execute "sudo defaults write /Library/Preferences/com.apple.alf globalstate -int 1 && \
         sudo defaults write /Library/Preferences/com.apple.alf stealthenabled -int 1 && \
         sudo defaults write /Library/Preferences/com.apple.alf loggingenabled -int 1" \
    "Enable firewall, stealth mode, and logging"

execute "/usr/libexec/ApplicationFirewall/socketfilterfw --setallowsignedapp off" \
    "Disable automatic downloaded software from receiving incoming connections"

# - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -

execute "networksetup -setairportpower en0 on" \
    "Reboot network interfaces"
