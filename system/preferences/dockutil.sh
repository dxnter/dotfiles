#!/usr/bin/env bash

cd "$(dirname "${BASH_SOURCE[0]}")" \
    && . "../utils.sh"

# - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -

# Apps in Dock order. Missing apps are skipped: some casks only install
# on Apple Silicon or macOS 14+, so the Intel Mac has fewer.
declare -a DOCK_APPS=(
    "/Applications/Google Chrome.app"
    "/Applications/Todoist.app"
    "/Applications/1Password.app"
    "/Applications/Fantastical.app"
    "/System/Applications/Messages.app"
    "/Applications/Claude.app"
    "/Applications/ChatGPT.app"
    "/Applications/Visual Studio Code.app"
    "/Applications/iTerm.app"
    "/Applications/Spotify.app"
)

# - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -

main() {

    local dockutil=""
    local app=""

    dockutil="$(resolve_bin "dockutil")"

    if ! cmd_exists "$dockutil"; then
        print_error "dockutil not found (installed by the Brewfile)"
        return 1
    fi

    print_info "• Set Dock Apps"

    execute "\"$dockutil\" --no-restart --remove all" \
        "Remove all apps from Dock"

    for app in "${DOCK_APPS[@]}"; do
        if [ -d "$app" ]; then
            execute "\"$dockutil\" --no-restart --add \"$app\"" \
                "$(basename "$app" .app)"
        else
            print_warning "$(basename "$app" .app) not installed => skipping"
        fi
    done

    execute "\"$dockutil\" --no-restart --add \"$HOME/Downloads\" --view fan --display stack --sort dateadded" \
        "Downloads"

    # ui_and_ux.sh points screencapture here and creates the folder.
    mkdir -p "$HOME/Documents/screenshots"
    execute "\"$dockutil\" --no-restart --add \"$HOME/Documents/screenshots\" --label Screenshots --view fan --display stack --sort dateadded" \
        "Screenshots"

    execute "killall Dock" \
        "Restart Dock"

}

main
