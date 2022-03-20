#!/usr/bin/env bash

cd "$(dirname "${BASH_SOURCE[0]}")" \
    && . "../utils.sh"

# - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -

# Ensure the OS is macOS and
# it's above the required version.

verify_os \
    || exit 1

# - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -

print_info "• Preferences"

# - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -

ask_for_sudo

# - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -

# Close any open `System Preferences` panes in order to
# avoid overriding the preferences that are being changed.

./close_system_preferences_panes.applescript

# - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -

./app_store.sh
./dock.sh
./finder.sh
./keyboard.sh
./language_and_region.sh
./maps.sh
./photos.sh
./safari.sh
./mail.sh
./activity_monitor.sh
./textedit.sh
./transmission.sh
./ui_and_ux.sh
./network.sh

ask_for_confirmation "Do you want to clear the dock and set it to applications in system/preferences/dockutil.sh?\n"
if answer_is_yes; then
    ./dockutil.sh
fi
