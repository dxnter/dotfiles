#!/usr/bin/env bash

cd "$(dirname "${BASH_SOURCE[0]}")" \
    && . "../../utils.sh" \
    && . "./utils.sh"

# - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -

print_info "• Set Dock Apps"

execute "dockutil --no-restart --remove all" \
    "Remove all apps from Dock"

execute "dockutil --no-restart --add '/Applications/Firefox.app'" \
    "Firefox"

execute "dockutil --no-restart --add '/Applications/Spotify.app'" \
    "Spotify"

execute "dockutil --no-restart --add '/Applications/Discord.app'" \
    "Discord"

execute "dockutil --no-restart --add '/Applications/Microsoft Outlook.app'" \
    "Microsoft Outlook"

execute "dockutil --no-restart --add '/Applications/Microsoft Teams.app'" \
    "Microsoft Teams"

execute "dockutil --no-restart --add '/Applications/zoom.us.app'" \
    "Zoom"

execute "dockutil --no-restart --add '/Applications/Obsidian.app'" \
    "Obsidian"

execute "dockutil --no-restart --add '/Applications/Visual Studio Code.app'" \
    "Visual Studio Code"

execute "dockutil --no-restart --add '/Applications/Alacritty.app'" \
    "Alacritty"

execute "dockutil --no-restart --add '/Applications/DBeaver.app'" \
    "DBeaver"

execute "dockutil --no-restart --add '/Applications/Cyberduck.app'" \
    "Cyberduck"

execute "dockutil --no-restart --add '/System/Applications/Utilities/Activity Monitor.app'" \
    "Activity Monitor"

execute "dockutil --no-restart --add '/System/Applications/System Preferences.app'" \
    "System Preferences"

execute "dockutil --add '~/Downloads' --view fan --display stack --sort dateadded --no-restart" \
    "Downloads"

# - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -

execute "killall Dock" \
    "Restart Dock"
