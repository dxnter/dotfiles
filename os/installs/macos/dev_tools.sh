#!/usr/bin/env bash

cd "$(dirname "${BASH_SOURCE[0]}")" \
    && . "../../utils.sh" \
    && . "./utils.sh"

# - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -

print_info "• Development Tools"

# CLI Tools
brew_install "Docker" "docker"
brew_install "Docker Compose" "docker-compose"
brew_install "Neovim" "neovim"
brew_install "HTTP Server" "http-server"
brew_install "Redis" "redis"

# GUI Tools
brew_install "Visual Studio Code" "visual-studio-code" "--cask"
brew install "Alacritty" "alacritty" "--cask"
brew_install "DBeaver" "dbeaver-community" "--cask"
brew_install "Postman" "postman" "--cask"
brew_install "PHPStorm" "phpstorm" "--cask"
brew_install "Cyberduck" "cyberduck" "--cask"

print_success "Development Tools installed"
