# Installed by `make brew` (brew bundle). Runtimes and most CLI tools live in mise
# (mise/.config/mise/config.toml), which installs prebuilt binaries on every Mac;
# Homebrew stopped publishing binaries for Intel Macs in Homebrew 7.
# Personal Macs get the same apps: where a current cask needs macOS 14, older Macs get a
# pinned cask from this repo's Casks/ folder instead (tapped below as dxnter/dotfiles).
# A work Mac skips the personal apps and gets its own short list at the end.

# Formulae depend on the CPU: Homebrew 7 builds no new Intel bottles on any macOS,
# including Intel Macs running a newer macOS through OpenCore Legacy Patcher.
# Casks depend on the macOS version.
intel = Hardware::CPU.intel?
legacy_macos = MacOS.version < :sonoma
# Work Macs set MISE_ENV=work in ~/.zshenv.local; mise reads the same variable for config.work.toml.
# Homebrew passes only HOMEBREW_* variables through, so `make brew` forwards it as HOMEBREW_MISE_ENV.
work = ENV.fetch("HOMEBREW_MISE_ENV", "").split(",").include?("work")
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
  brew "syncthing" unless work
  brew "dpkg"
  brew "lzlib"
  brew "iperf3"
  brew "gpac"

  # Databases, keys and LaTeX
  brew "postgresql@17"
  brew "pgvector"
  brew "gnupg"
  brew "pinentry-mac"
  brew "ykman" unless work
  brew "latexindent" unless work
end

# Development
cask "herd"
cask legacy_macos ? "dxnter/dotfiles/orbstack@ventura" : "orbstack"
cask "visual-studio-code"
cask "ghostty"
cask "1password-cli"
cask "dbeaver-community"

# Browsers
cask "google-chrome"
cask "firefox@developer-edition"

# Productivity
cask "1password"
cask "raycast"
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

# Fonts
cask "font-fira-code"
cask "font-jetbrains-mono" # VS Code

if work
  cask "jetbrains-toolbox"
  cask "bruno"
  cask "hammerspoon"
  cask "windows-app"
  cask "logitech-g-hub"
  cask "spotify"
else
  # Development
  cask "android-platform-tools"
  # Java 17 for home-media-lab's Android TV build (CI uses Temurin 17). The pkg registers
  # with /usr/libexec/java_home, so `java_home -v 17` and the /usr/bin/java stub find it.
  cask "temurin@17"

  # Productivity
  cask "keepassxc"
  cask "fantastical"

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
end
