#!/usr/bin/env bash

cd "$(dirname "${BASH_SOURCE[0]}")" \
    && . "../utils.sh"

# - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -

print_info "• Development Tools"

# CLI Tools
brew_install "Docker" "docker"
brew_install "Docker Compose" "docker-compose"
brew_install "HTTP Server" "http-server"
brew_install "Redis" "redis"
brew_install "Python" "python"

# GUI Tools
brew_install "Visual Studio Code" "visual-studio-code" "--cask"
brew_install "iTerm 2" "iterm2" "--cask"
brew_install "DBeaver" "dbeaver-community" "--cask"
brew_install "UTM" "utm" "--cask"
brew_install "Insomnia" "insomnia" "--cask"
brew_install "Cyberduck" "cyberduck" "--cask"
brew_install "Fig" "fig" "--cask"
brew_install "Mullvad" "mullvadvpn" "--cask"
