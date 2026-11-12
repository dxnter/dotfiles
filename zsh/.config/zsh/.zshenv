# Read by every zsh (login, interactive, scripts). Environment only: no external commands,
# no secrets. PATH lives in .zprofile, apart from the mise shims below; interactive setup in .zshrc.

export XDG_CONFIG_HOME="${HOME}/.config"
export XDG_CACHE_HOME="${HOME}/.cache"
export XDG_LOCAL_HOME="${HOME}/.local"
export XDG_DATA_HOME="${XDG_LOCAL_HOME}/share"
[[ -d "${XDG_CACHE_HOME}/zsh" ]] || mkdir -p "${XDG_CACHE_HOME}/zsh"

export ZDOTDIR="${XDG_CONFIG_HOME}/zsh"
export ZSH="${ZDOTDIR}/.oh-my-zsh"
export ZSH_COMPDUMP="${XDG_CACHE_HOME}/zsh/zcompdump-${HOST%%.*}-${ZSH_VERSION}"

export DOTFILES_DIR="${HOME}/.dotfiles"
export DOTFILES_IDE="code"

# Language
export LANGUAGE="en_US.UTF-8"
export LANG="${LANGUAGE}"
export LC_ALL="${LANGUAGE}"

# Editors
export EDITOR=nvim
export VISUAL="${EDITOR}"
export GIT_EDITOR="code --wait"

# Tool homes (PATH entries for these are added in .zprofile)
export GOPATH="${HOME}/go"
export BUN_INSTALL="${HOME}/.bun"
export PNPM_HOME="${XDG_DATA_HOME}/pnpm"

# mise shims for every zsh, including the non-login `zsh -c` that GUI apps and agents spawn.
# .zprofile prepends them again after path_helper, so login shells keep mise ahead of /usr/bin.
typeset -U path PATH
[[ -d "${XDG_DATA_HOME}/mise/shims" ]] && path=("${XDG_DATA_HOME}/mise/shims" $path)

# mise loads config.legacy.toml on macOS 13 and older (Darwin 22 and below).
# Read the running kernel: zsh's $OSTYPE is the OS zsh was compiled on.
[[ "$(uname -r)" == (1[0-9]|2[0-2]).* ]] && export MISE_ENV="legacy"

# Misc.
export HOMEBREW_NO_AUTO_UPDATE=1
export DISABLE_UPDATE_PROMPT=true
export XDEBUG_CONFIG="idekey=VSCODE"
export FZF_DEFAULT_COMMAND='fd --type f --strip-cwd-prefix --hidden --follow --exclude .git'
export FZF_CTRL_T_COMMAND="${FZF_DEFAULT_COMMAND}"
# Carbonfox colors, a 60%-height window with a border instead of full screen
export FZF_DEFAULT_OPTS="--height=60% --layout=reverse --border=rounded --info=inline-right \
--prompt='❯ ' --pointer='▌' --marker='+' --gutter=' ' --preview-window=border-left \
--color=fg:#dfdfe0,bg:-1,hl:#78a9ff,fg+:#f2f4f8,bg+:#2a2a2a,hl+:#78a9ff \
--color=info:#6e6f70,prompt:#be95ff,pointer:#ee5396,marker:#25be6a,spinner:#33b1ff \
--color=header:#6e6f70,border:#484848,label:#be95ff,query:#f2f4f8"

# 1Password CLI: use desktop app integration without reading the app's settings file.
# macOS blocks apps without Full Disk Access (e.g. T3 Code) from that file, so op
# would otherwise report "No accounts configured".
export OP_BIOMETRIC_UNLOCK_ENABLED=true

# Herd MinIO (local dev only)
export MINIO_ROOT_USER="minio"
export MINIO_ROOT_PASSWORD="password"

# Machine-local overrides and secrets (never committed): keychain-backed variables, etc.
[[ -f "${HOME}/.zshenv.local" ]] && source "${HOME}/.zshenv.local"
