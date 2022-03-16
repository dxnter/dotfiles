#!/usr/bin/env bash

cd "$(dirname "${BASH_SOURCE[0]}")" \
    && . "utils.sh"

# - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -

main() {

    print_error "System restarting in 3 seconds..."

    sleep 3
    sudo shutdown -r now &> /dev/null

 }

 main
