# Interactive shells only.

# oh-my-zsh
plugins=(
  git
  macos
  composer
  fzf-tab
  zsh-syntax-highlighting
  zsh-autosuggestions
)
source "${ZSH}/oh-my-zsh.sh"

# History (set after oh-my-zsh, which resets HISTFILE)
export HISTFILE="${ZDOTDIR}/.zsh_history"
HISTSIZE=100000
SAVEHIST=100000
setopt SHARE_HISTORY HIST_IGNORE_ALL_DUPS HIST_IGNORE_SPACE HIST_REDUCE_BLANKS

export GPG_TTY=$(tty)

# nvm: load the functions but skip `nvm use default` (the default Node is already on PATH from .zprofile)
[[ -n "${NVM_DIR}" && -s "${NVM_DIR}/nvm.sh" ]] && source "${NVM_DIR}/nvm.sh" --no-use

# Aliases, functions, and ~/.zshrc.local
[[ -f "${ZDOTDIR}/.zsh_profile" ]] && source "${ZDOTDIR}/.zsh_profile"

eval "$(starship init zsh)"

[[ -s "${BUN_INSTALL}/_bun" ]] && source "${BUN_INSTALL}/_bun"

# Installers (Herd, Codex, ...) append to ~/.zshrc, which zsh never reads once ZDOTDIR is set. Honour it anyway.
[[ "${ZDOTDIR}" != "${HOME}" && -f "${HOME}/.zshrc" ]] && source "${HOME}/.zshrc"
