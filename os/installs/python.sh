#!/bin/bash

cd "$(dirname "${BASH_SOURCE[0]}")" \
    && . "../utils.sh"

# - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -

python2_version="2.7.14"
python3_version="3.9.1"

print_info "• Python"

asdf plugin add python
asdf install python "${python2_version}"
asdf install python "${python3_version}"
asdf global python "${python3_version} ${python2_version}"

print_success "Python ${python2_version} & ${python3_version} installed"
