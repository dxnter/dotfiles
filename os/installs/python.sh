#!/bin/bash

cd "$(dirname "${BASH_SOURCE[0]}")" \
    && . "../utils.sh"

# - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -

python3_version="3.10.2"

print_info "• Python"


asdf uninstall python
asdf plugin add python
asdf install python "${python3_version}"
asdf global python "${python3_version}"

print_success "Python ${python3_version} installed"
