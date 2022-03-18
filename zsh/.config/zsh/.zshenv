export XDG_CONFIG_HOME="${HOME}/.config"
export XDG_CACHE_HOME="${HOME}/.cache"
export XDG_LOCAL_HOME="${HOME}/.local"
export XDG_DATA_HOME="${XDG_LOCAL_HOME}/share"

if [[ ! -d "${XDG_CONFIG_HOME}/zsh" ]]; then
	mkdir -p "${XDG_CONFIG_HOME}/zsh"
fi

if [[ ! -d "${XDG_CACHE_HOME}/zsh" ]]; then
	mkdir -p "${XDG_CACHE_HOME}/zsh"
fi

export ZDOTDIR="${XDG_CONFIG_HOME}/zsh"
export ZSH="${XDG_CONFIG_HOME}/zsh/.oh-my-zsh"
export ZSH_COMPDUMP="${XDG_CACHE_HOME}/zsh/zcompdump-${SHORT_HOST}-${ZSH_VERSION}"

export DOTFILES_DIR="${HOME}/.dotfiles"
export DOTFILES_IDE="code"

# Language
export LANGUAGE="en_US.UTF-8"
export LANG="${LANGUAGE}"
export LC_ALL="${LANGUAGE}"
export LC_TYPE="${LANGUAGE}"

# Editor
export EDITOR=nvim
export CVSEDITOR="${EDITOR}"
export SVN_EDITOR="${EDITOR}"
export GIT_EDITOR="code"

# History
export HISTFILE="${XDG_CACHE_HOME}/zsh/history"
export HISTSIZE=10000
export SAVEHIST=1000000

# Misc.
export HOMEBREW_NO_AUTO_UPDATE=1
export DISABLE_UPDATE_PROMPT=true
export TERM=xterm-256color
export GPG_TTY=$(tty)

# - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -
# PATH
# - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -
# User bin
export PATH="$PATH:$HOME/bin"

# Local bin
export PATH="$HOME/.local/bin:$PATH"

# dotfiles utilities
export PATH="$DOTFILES_DIR/bin:$PATH"

# Homebrew
export PATH="/opt/homebrew/bin:$PATH"
export PATH="/opt/homebrew/sbin:$PATH"
export PATH="/usr/local/sbin:$PATH"

# asdf
export ASDF_DIR=$HOME/.asdf
export PATH="$HOME/.asdf/bin:$HOME/.asdf/shims:$PATH"

# Composer
export PATH="$HOME/.composer/vendor/bin:$PATH"

# Cargo
export PATH="$HOME/.cargo/bin:$PATH"
export PATH="$HOME/.cargo/env:$PATH"
