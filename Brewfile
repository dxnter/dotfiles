# Installed by `make brew` (brew bundle). Runtimes and most CLI tools live in mise
# (mise/.config/mise/config.toml), which installs prebuilt binaries on every Mac.
# Every Mac gets the same apps: where a current cask needs macOS 14, older Macs get a
# pinned cask from this repo's Casks/ folder instead (tapped below as dxnter/dotfiles).

legacy_macos = MacOS.version < :sonoma
tap "dxnter/dotfiles", ENV.fetch("DOTFILES_DIR", File.join(Dir.home, ".dotfiles")) if legacy_macos

# Shell
brew "zsh"

# GNU and core utilities
brew "findutils"
brew "gnu-sed"
brew "gnu-tar"
brew "grep"
brew "gpatch"
brew "make"
brew "moreutils"
brew "curl"
brew "wget"

# CLI tools
brew "the_silver_searcher"
brew "tree"
brew "htop"
brew "fastfetch"
brew "tmux"
brew "reattach-to-user-namespace"
brew "stow"
brew "grip"
brew "dpkg"
brew "http-server"
brew "lzlib"
brew "iperf3"
brew "syncthing"

# Git and signing
brew "git"
brew "gnupg"
brew "pinentry-mac"

# Media
brew "gpac"

# macOS preferences
brew "dockutil"

# Development
cask "herd"
cask legacy_macos ? "dxnter/dotfiles/orbstack@ventura" : "orbstack"
cask "visual-studio-code"
cask "iterm2"
cask "ngrok"
cask "1password-cli"

# Browsers
cask "google-chrome"
cask "firefox@developer-edition"

# Productivity
cask "1password"
cask "keepassxc"
cask "raycast"
cask "fantastical"
cask "todoist-app"
cask "hiddenbar"
cask "linearmouse"
cask "the-unarchiver"
cask "cleanshot"

# AI
cask "claude"
cask "chatgpt"

# Communication
cask "discord"
cask "signal"

# Network and security
cask "tailscale-app"
cask legacy_macos ? "dxnter/dotfiles/protonvpn@ventura" : "protonvpn"
cask "yubico-authenticator"

# Media
cask "spotify"
cask "vlc"

# Fonts
cask "font-fira-code"
