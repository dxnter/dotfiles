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

# Close System Settings so it doesn't overwrite
# the preferences that are being changed.

./close_system_preferences_panes.applescript

# - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -

./dock.sh
./finder.sh
./keyboard.sh
./activity_monitor.sh
./textedit.sh
./ui_and_ux.sh

# On a work Mac, MDM owns Software Update and the firewall, and the dock list is personal.
if is_work_mac; then
    print_warning "Work Mac: skipping Software Update, firewall and dock layout"
else
    ./software_update.sh
    ./firewall.sh

    ask_for_confirmation "Do you want to clear the dock and set it to applications in system/preferences/dockutil.sh?\n"
    if answer_is_yes; then
        ./dockutil.sh
    fi
fi

print_warning "Keyboard and global settings take effect after logging out and back in"
