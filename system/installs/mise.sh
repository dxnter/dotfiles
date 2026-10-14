#!/usr/bin/env bash

cd "$(dirname "${BASH_SOURCE[0]}")" \
    && . "../utils.sh"

# - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -

install_mise() {

    # The official installer ships a prebuilt binary for Intel and Apple Silicon;
    # Homebrew has no Intel bottle and would compile it from source.
    if [ ! -x "$HOME/.local/bin/mise" ] && ! cmd_exists "mise"; then
        execute "curl -fsSL https://mise.run | sh" \
            "mise (install)" \
            || return 1
    fi

}

main() {

    local mise=""

    print_info "• mise"

    install_mise || exit 1

    mise="$HOME/.local/bin/mise"
    [ -x "$mise" ] || mise="$(command -v mise)"

    # Same check as .zshenv: pin older tool versions on macOS 13 and below.
    if [ "$(uname -r | cut -d. -f1)" -lt 23 ]; then
        export MISE_ENV="legacy"
    fi

    # Unauthenticated GitHub API calls are limited to 60 an hour, which a full
    # install can exceed. Reuse the GitHub CLI login when there is one.
    if [ -z "$GITHUB_TOKEN" ] && cmd_exists "gh" && gh auth token &> /dev/null; then
        GITHUB_TOKEN="$(gh auth token)"
        export GITHUB_TOKEN
    fi

    # Reads ~/.config/mise/config.toml, so symlinks must exist first.
    if "$mise" install --yes; then
        print_success "mise install (runtimes and CLI tools${MISE_ENV:+, legacy pins})"
    else
        print_error "mise install"
        print_warning "If GitHub rate-limited the downloads, run 'gh auth login' and then 'make mise' again"
        return 1
    fi

}

main
