# Read by every zsh (login, interactive, scripts). Environment only: no PATH edits,
# no external commands, no secrets. PATH lives in .zprofile; interactive setup in .zshrc.

export XDG_CONFIG_HOME="${HOME}/.config"
export XDG_CACHE_HOME="${HOME}/.cache"
export XDG_LOCAL_HOME="${HOME}/.local"
export XDG_DATA_HOME="${XDG_LOCAL_HOME}/share"
[[ -d "${XDG_CACHE_HOME}/zsh" ]] || mkdir -p "${XDG_CACHE_HOME}/zsh"

export ZDOTDIR="${XDG_CONFIG_HOME}/zsh"
export ZSH="${ZDOTDIR}/.oh-my-zsh"
export ZSH_COMPDUMP="${XDG_CACHE_HOME}/zsh/zcompdump-${SHORT_HOST}-${ZSH_VERSION}"

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

# Misc.
export HOMEBREW_NO_AUTO_UPDATE=1
export DISABLE_UPDATE_PROMPT=true
export XDEBUG_CONFIG="idekey=VSCODE"
export FZF_DEFAULT_COMMAND='fd --type f --strip-cwd-prefix --hidden --follow --exclude .git'
export FZF_CTRL_T_COMMAND="${FZF_DEFAULT_COMMAND}"

# Herd MinIO (local dev only)
export MINIO_ROOT_USER="minio"
export MINIO_ROOT_PASSWORD="password"

# Machine-local overrides and secrets (never committed): NVM_DIR, keychain-backed variables, etc.
[[ -f "${HOME}/.zshenv.local" ]] && source "${HOME}/.zshenv.local"
