#!/usr/bin/env bash

cd "$(dirname "${BASH_SOURCE[0]}")" \
    && . "../utils.sh"

# - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -

print_info "• mise runtimes"

# Reads ~/.config/mise/config.toml, so symlinks must exist first.
"$(resolve_bin "mise")" install --yes
print_result $? "mise install (node, pnpm, bun, python, uv, rust, go)"
