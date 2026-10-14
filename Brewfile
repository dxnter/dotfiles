# Installed by `make brew` (brew bundle). Runtimes and most CLI tools live in mise
# (mise/.config/mise/config.toml), which installs prebuilt binaries on every Mac;
# Homebrew stopped publishing binaries for Intel Macs in Homebrew 7.
# Every Mac gets the same apps: where a current cask needs macOS 14, older Macs get a
# pinned cask from this repo's Casks/ folder instead (tapped below as dxnter/dotfiles).

legacy_macos = MacOS.version < :sonoma
tap "dxnter/dotfiles", ENV.fetch("DOTFILES_DIR", File.join(Dir.home, ".dotfiles")) if legacy_macos

# Prebuilt for every Mac, including Intel on macOS 13
brew "stow"
brew "dockutil"
brew "make"
brew "gpatch"

# Homebrew has no Intel binaries for these, so older Macs would compile them from
# source. Those Macs use macOS's own zsh, git, curl, grep, sed and tar instead.
unless legacy_macos
  brew "zsh"
  brew "git"
  brew "curl"
  brew "wget"
  brew "findutils"
  brew "gnu-sed"
  brew "gnu-tar"
  brew "grep"
  brew "moreutils"
  brew "the_silver_searcher"
  brew "tree"
  brew "htop"
  brew "tmux"
  brew "reattach-to-user-namespace"
  brew "fastfetch"
  brew "syncthing"
  brew "dpkg"
  brew "lzlib"
  brew "iperf3"
  brew "gpac"
end

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
