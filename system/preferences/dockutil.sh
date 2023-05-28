#!/usr/bin/env bash

cd "$(dirname "${BASH_SOURCE[0]}")" \
    && . "../utils.sh"

if [ ! `which dockutil` ]; then
    wget="$(resolve_bin 'wget')"

    print_info "• Dockutil"

    dockutilDownloadURL=$(curl -s https://api.github.com/repos/kcrawford/dockutil/releases/latest \
            | grep 'browser_download_url.*pkg' \
            | cut -d : -f 2,3 \
            | tr -d \" \
            | $wget -O /tmp/dockutil.pkg -qi -)

    execute "$dockutilDownloadURL" \
        "Downloading dockutil"

    sudo installer -pkg /tmp/dockutil.pkg -target /
    print_info "Installed dockutil"
fi

dockutil=$(resolve_bin "dockutil")

# - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -

print_info "• Set Dock Apps"

execute "$dockutil --no-restart --remove all" \
    "Remove all apps from Dock"

execute "$dockutil --no-restart --add '/Applications/Todoist.app'" \
    "Todoist"

execute "$dockutil --no-restart --add '/Applications/Google Chrome.app'" \
    "Google Chrome"

execute "$dockutil --no-restart --add '/Applications/1Password.app'" \
    "1Password"

execute "$dockutil --no-restart --add '/Applications/Obsidian.app'" \
    "Obsidian"

execute "$dockutil --no-restart --add '/Applications/Linear.app'" \
    "Linear"

execute "$dockutil --no-restart --add '/Applications/Fantastical.app'" \
    "Fantastical"

execute "$dockutil --no-restart --add '/Applications/Spotify.app'" \
    "Spotify"

execute "$dockutil --no-restart --add '/Applications/Discord.app'" \
    "Discord"

execute "$dockutil --no-restart --add '/Applications/Messages.app'" \
    "Messages"

execute "$dockutil --no-restart --add '/Applications/iTerm.app'" \
    "iTerm"

execute "$dockutil --no-restart --add '/Applications/Docker.app'" \
    "Docker"

execute "$dockutil --no-restart --add '/Applications/RapidAPI.app'" \
    "RapidAPI"

execute "$dockutil --no-restart --add '/Applications/Visual Studio Code.app'" \
    "Visual Studio Code"

execute "$dockutil --no-restart --add '/Applications/DBeaver.app'" \
    "DBeaver"

execute "$dockutil --add '~/Downloads' --view fan --display stack --sort dateadded --no-restart" \
    "Downloads"

# - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -

execute "killall Dock" \
    "Restart Dock"
