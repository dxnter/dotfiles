#!/usr/bin/env bash

cd "$(dirname "${BASH_SOURCE[0]}")" \
    && . "../utils.sh"

# - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -

print_info "• Spotlight"

execute "sudo mdutil -i off -a" \
    "Disable Spotlight indexing"


# - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -
