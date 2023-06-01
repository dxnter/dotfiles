#!/usr/bin/env bash

cd "$(dirname "${BASH_SOURCE[0]}")" \
    && . "../utils.sh"

# - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -

if [ -d "/Applications/PHP Monitor.app" ]; then
    print_info "PHP Monitor already installed => skipping"
else
    wget="$(resolve_bin 'wget')"

    print_info "• PHP Monitor"

    phpmonDownloadURL=$(curl -s https://api.github.com/repos/nicoverbruggen/phpmon/releases/latest \
            | grep 'browser_download_url.*zip' \
            | cut -d : -f 2,3 \
            | tr -d \" \
            | $wget -O /tmp/phpmon.zip -qi -)

    execute "$phpmonDownloadURL" \
        "Downloading PHP Monitor"

    execute "unzip /tmp/phpmon.zip -d /Applications/" \
        "Installing PHP Monitor"
fi
