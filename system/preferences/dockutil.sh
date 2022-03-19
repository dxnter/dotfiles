#!/usr/bin/env bash

cd "$(dirname "${BASH_SOURCE[0]}")" \
    && . "../utils.sh"

if [ ! `which dockutil` ]; then
    wget="$(resolve_bin "wget")"

    print_info "• Dockutil"

    dockutilDownloadURL=$(curl -s https://api.github.com/repos/kcrawford/dockutil/releases/latest \
            | grep 'dockutil-*.pkg' \
            | cut -d : -f 2,3 \
            | tr -d \" \
            | $wget -O /tmp/dockutil.pkg -qi -)

    execute "$dockutilDownloadURL" \
        "Downloading dockutil"

    execute "installer -pkg /tmp/dockutil.pkg -target CurrentUserHomeDirectory" \
        "Installing dockutil"
fi

dockutil=$(resolve_bin "dockutil")

# - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -

print_info "• Set Dock Apps"

execute "$dockutil --no-restart --remove all" \
    "Remove all apps from Dock"

execute "$dockutil --no-restart --add '/Applications/Firefox.app'" \
    "Firefox"

execute "$dockutil --no-restart --add '/Applications/Spotify.app'" \
    "Spotify"

execute "$dockutil --no-restart --add '/Applications/Discord.app'" \
    "Discord"

execute "$dockutil --no-restart --add '/Applications/zoom.us.app'" \
    "Zoom"

execute "$dockutil --no-restart --add '/Applications/Obsidian.app'" \
    "Obsidian"

execute "$dockutil --no-restart --add '/Applications/Visual Studio Code.app'" \
    "Visual Studio Code"

execute "$dockutil --no-restart --add '/Applications/Alacritty.app'" \
    "Alacritty"

execute "$dockutil --no-restart --add '/Applications/DBeaver.app'" \
    "DBeaver"

execute "$dockutil --no-restart --add '/Applications/Cyberduck.app'" \
    "Cyberduck"

execute "$dockutil --no-restart --add '/System/Applications/System Preferences.app'" \
    "System Preferences"

execute "$dockutil --add '~/Downloads' --view fan --display stack --sort dateadded --no-restart" \
    "Downloads"

# - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -

execute "killall Dock" \
    "Restart Dock"
