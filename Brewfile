# Installed by `make brew` (brew bundle). Runtimes and most CLI tools live in mise
# (mise/.config/mise/config.toml), which installs prebuilt binaries on every Mac;
# Homebrew stopped publishing binaries for Intel Macs in Homebrew 7.
# Every Mac gets the same apps: where a current cask needs macOS 14, older Macs get a
# pinned cask from this repo's Casks/ folder instead (tapped below as dxnter/dotfiles).

# Formulae depend on the CPU: Homebrew 7 builds no new Intel bottles on any macOS,
# including Intel Macs running a newer macOS through OpenCore Legacy Patcher.
# Casks depend on the macOS version.
intel = Hardware::CPU.intel?
legacy_macos = MacOS.version < :sonoma
tap "dxnter/dotfiles", ENV.fetch("DOTFILES_DIR", File.join(Dir.home, ".dotfiles")) if legacy_macos

# Prebuilt for every Mac. Intel bottles stop at Sonoma or later, and newer macOS reuses them.
brew "stow"
brew "dockutil"
brew "make"
brew "gpatch"

# Homebrew has no Intel binaries for these, so Intel Macs would compile them from
# source. Those Macs use macOS's own zsh, git, curl, grep, sed and tar instead.
unless intel
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
  brew "syncthing"
  brew "dpkg"
  brew "lzlib"
  brew "iperf3"
  brew "gpac"

  # Databases, keys and LaTeX
  brew "postgresql@17"
  brew "pgvector"
  brew "gnupg"
  brew "pinentry-mac"
  brew "ykman"
  brew "latexindent"
end

# Development
cask "herd"
cask legacy_macos ? "dxnter/dotfiles/orbstack@ventura" : "orbstack"
cask "visual-studio-code"
cask "ghostty"
cask "1password-cli"
cask "dbeaver-community"
cask "android-platform-tools"
# Java 17 for home-media-lab's Android TV build (CI uses Temurin 17). The pkg registers
# with /usr/libexec/java_home, so `java_home -v 17` and the /usr/bin/java stub find it.
cask "temurin@17"

# Browsers
cask "google-chrome"
cask "firefox@developer-edition"

# Productivity
cask "1password"
cask "keepassxc"
cask "raycast"
cask "fantastical"
cask "todoist-app"
# Thaw (menu bar manager) needs macOS 27; older Macs get Hidden Bar.
cask MacOS.version >= "27" ? "thaw@beta" : "hiddenbar"
cask "betterdisplay"
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
# Little Snitch 6 needs macOS 14, and there is no older cask to pin.
cask "little-snitch" unless legacy_macos
cask legacy_macos ? "dxnter/dotfiles/protonvpn@ventura" : "protonvpn"

# Media
cask "vlc"
cask "transmission"

# Design and writing
cask "freecad"
cask "basictex"

# Fonts
cask "font-fira-code"
cask "font-jetbrains-mono" # VS Code
