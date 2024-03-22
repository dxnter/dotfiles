#!/usr/bin/env bash

cd "$(dirname "${BASH_SOURCE[0]}")" \
    && . "../utils.sh"

# - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -

print_info "• Development Tools"

# CLI Tools
brew_install "Docker" "docker" "--cask"
brew_install "Docker Compose" "docker-compose"
brew_install "HTTP Server" "http-server"
brew_install "Redis" "redis"
brew_install "PostgreSQL" "postgresql@14"
brew_install "PHP" "php"
brew_install "MailHog" "mailhog"
brew_install "Minio" "minio/stable/minio"
brew_install "Minio Client" "minio/stable/mc"

# GUI Tools
brew_install "Visual Studio Code" "visual-studio-code" "--cask"
brew_install "Jetbrains Toolbox" "jetbrains-toolbox" "--cask"
brew_install "iTerm 2" "iterm2" "--cask"
brew_install "DBeaver" "dbeaver-community" "--cask"
brew_install "RapidAPI" "rapidapi" "--cask"
brew_install "HELO" "helo" "--cask"
brew_install "Ray" "ray" "--cask"
brew_install "Insomnia" "insomnia" "--cask"
brew_install "Cyberduck" "cyberduck" "--cask"
brew_install "Mullvad" "mullvadvpn" "--cask"
