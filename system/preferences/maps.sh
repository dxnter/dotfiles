#!/usr/bin/env bash

cd "$(dirname "${BASH_SOURCE[0]}")" \
    && . "../utils.sh"

# - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -

print_info "• Maps"

execute "defaults write com.apple.Maps LastClosedWindowViewOptions '{
            localizeLabels = 1;   // show labels in English
            mapType = 11;         // show hybrid map
            trafficEnabled = 1;   // show traffic
         }'" \
    "Set view options"

killall "Maps" &> /dev/null
