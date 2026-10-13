#!/usr/bin/env bash

cd "$(dirname "${BASH_SOURCE[0]}")" \
    && . "utils.sh"

# - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -

set_hostname() {

    print_info "• Set hostname"

    ask "Enter the desired hostname for the computer: "
    hostName="$(get_answer)"

    if [ -z "$hostName" ]; then
        print_warning "No hostname entered => skipping"
        return 0
    fi

    # LocalHostName and HostName only allow letters, digits and hyphens.
    localHostName="$(printf "%s" "$hostName" | tr -cs '[:alnum:]-' '-' | sed 's/^-*//; s/-*$//')"

    execute "sudo scutil --set ComputerName \"$hostName\"" \
        "ComputerName"

    execute "sudo scutil --set HostName \"$localHostName\"" \
        "HostName"

    execute "sudo scutil --set LocalHostName \"$localHostName\"" \
        "LocalHostName"
}

set_hostname
