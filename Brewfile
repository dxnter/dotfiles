# Installed by `make brew` (brew bundle). Language runtimes live in mise, not here.
# Guards keep the same file working on Apple Silicon and on the 2017 Intel Mac (macOS 13 max).

# Shell
brew "zsh"
brew "starship"
brew "mise"

# GNU and core utilities
brew "findutils"
brew "gnu-sed"
brew "gnu-tar"
brew "grep"
brew "gpatch"
brew "make"
brew "cmake"
brew "moreutils"
brew "curl"
brew "wget"

# CLI tools
brew "bat"
brew "fd"
brew "fzf"
brew "git-delta"
brew "jq"
brew "lsd"
brew "ripgrep"
brew "the_silver_searcher"
brew "tree"
brew "htop"
brew "ctop"
brew "fastfetch"
brew "neofetch"
brew "neovim"
brew "tmux"
brew "reattach-to-user-namespace"
brew "stow"
brew "mas"
brew "pandoc"
brew "grip"
brew "dpkg"
brew "http-server"
brew "lbzip2"
brew "lzlib"
brew "iperf3"
brew "restic"
brew "sops"
brew "syncthing"
brew "cosign"
brew "oras"

# Git and signing
brew "git"
brew "git-lfs"
brew "gh"
brew "gnupg"
brew "pinentry-mac"

# Media
brew "ffmpeg"
brew "gpac"
brew "imagemagick"
brew "yt-dlp"

# macOS preferences
brew "dockutil"

# Development
cask "herd"
cask "orbstack" if MacOS.version >= :sonoma
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
cask "raycast" if Hardware::CPU.arm?
cask "fantastical"
cask "todoist-app"
cask "hiddenbar"
cask "linearmouse"
cask "the-unarchiver"
cask "cleanshot"

# AI
cask "claude"
cask "chatgpt" if Hardware::CPU.arm?

# Communication
cask "discord"
cask "signal"

# Network and security
cask "tailscale-app"
cask "protonvpn" if MacOS.version >= :sonoma
cask "yubico-authenticator"

# Media
cask "spotify"
cask "vlc"

# Fonts
cask "font-fira-code"
