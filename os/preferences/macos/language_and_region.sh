#!/bin/sh

cd "$(dirname "${BASH_SOURCE[0]}")" \
    && . "../../utils.sh"

# - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -

print_info "• Language & Region"

execute "defaults write -g AppleLanguages -array 'en_US'" \
    "Set language"

execute "defaults write NSGlobalDomain AppleLocale -string 'en_US@currency=USD'" \
    "Set locale"

execute "defaults write -g AppleMeasurementUnits -string 'Inches'" \
    "Set measurement units"

execute "defaults write NSGlobalDomain AppleMetricUnits -bool false" \
    "Set metric units"
