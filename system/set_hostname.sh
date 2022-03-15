#!/usr/bin/env bash

cd "$(dirname "${BASH_SOURCE[0]}")" \
    && . "utils.sh"

# - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -

set_hostname() {

    print_info "• Set hostname"

    ask "Enter the desired hostname for the computer: "
    hostName="$(get_answer)"

    execute "sudo scutil --set ComputerName $hostName" \
        "ComputerName"

    execute "sudo scutil --set HostName $hostName" \
        "HostName"

    execute "sudo scutil --set LocalHostName $hostName" \
        "LocalHostName"

    execute "sudo defaults write /Library/Preferences/SystemConfiguration/com.apple.smb.server NetBIOSName -string $hostName" \
        "NetBIOSName"
}

set_hostname
