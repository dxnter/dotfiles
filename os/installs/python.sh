#!/bin/bash

cd "$(dirname "${BASH_SOURCE[0]}")" \
    && . "../utils.sh"

# - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -

python3_version="3.10.2"

print_info "• Python"


asdf plugin remove python
asdf plugin add python
LDFLAGS="-L/usr/local/opt/bzip2/lib -L/usr/local/opt/zlib/lib -L/usr/local/opt/openssl@1.1/lib" CFLAGS="-I/usr/local/opt/bzip2/include -I/usr/local/opt/zlib/include -I/usr/local/opt/openssl@1.1/include -I$(xcrun --show-sdk-path)/usr/include -Wno-implicit-function-declaration" asdf install python "${python3_version}"
asdf global python "${python3_version}"

print_success "Python ${python3_version} installed"
