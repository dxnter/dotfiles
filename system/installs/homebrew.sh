#!/usr/bin/env bash

cd "$(dirname "${BASH_SOURCE[0]}")" \
    && . "../utils.sh"

# - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -

# The official installer refuses Intel Macs, but Homebrew itself still runs there
# (Tier 3 until September 2027, see docs.brew.sh/Support-Tiers). Do what the
# installer used to do on Intel: a git checkout in /usr/local/Homebrew.
install_homebrew_intel() {

    local prefix="/usr/local"
    local dir=""
    declare -a dirs=(
        "Homebrew" "bin" "etc" "include" "lib" "sbin" "share" "var" "opt"
        "Cellar" "Caskroom" "Frameworks" "share/zsh" "share/zsh/site-functions"
        "var/homebrew" "var/homebrew/linked"
    )

    for dir in "${dirs[@]}"; do
        sudo mkdir -p "$prefix/$dir" \
            && sudo chown "$USER:admin" "$prefix/$dir" \
            && sudo chmod u+rwx "$prefix/$dir" \
            || return 1
    done

    if [ ! -d "$prefix/Homebrew/.git" ]; then
        git clone --quiet https://github.com/Homebrew/brew "$prefix/Homebrew" \
            || return 1
    fi

    ln -sf "$prefix/Homebrew/bin/brew" "$prefix/bin/brew" \
        && "$prefix/bin/brew" update --force --quiet

}

install_homebrew() {

    if ! cmd_exists "brew" && [ ! -x "$brewCommand" ]; then
        ask_for_sudo

        if [[ "$(uname -m)" == "arm64" ]]; then
            execute \
                "NONINTERACTIVE=1 /bin/bash -c \"\$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)\"" \
                "Homebrew (install)" \
                || exit 1
        else
            execute "install_homebrew_intel" \
                "Homebrew (install from git on Intel)" \
                || exit 1
        fi
    fi

    # A fresh install is not on PATH yet; load it for the rest of the setup.
    eval "$("$brewCommand" shellenv)"

}

opt_out_of_analytics() {

    execute \
        "$brewCommand analytics off" \
        "Homebrew (opt-out of analytics)"

}

# - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -

main() {

    print_info "• Homebrew"

    install_homebrew
    opt_out_of_analytics

    brew_update
    brew_upgrade

}

main
