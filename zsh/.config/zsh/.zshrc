# Interactive shells only.

# oh-my-zsh
# Skip compaudit's permission scan of every completion directory (~50ms per shell)
ZSH_DISABLE_COMPFIX=true
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

# Aliases, functions, and ~/.zshrc.local
[[ -f "${ZDOTDIR}/.zsh_profile" ]] && source "${ZDOTDIR}/.zsh_profile"

[[ -s "${BUN_INSTALL}/_bun" ]] && source "${BUN_INSTALL}/_bun"

# Installers (Herd, Codex, ...) append to ~/.zshrc, which zsh never reads once ZDOTDIR is set. Honour it anyway.
[[ "${ZDOTDIR}" != "${HOME}" && -f "${HOME}/.zshrc" ]] && source "${HOME}/.zshrc"

# mise last: its prompt hook re-asserts mise's runtimes ahead of anything the files above put on PATH (e.g. Herd's nvm)
(( $+commands[mise] )) && eval "$(mise activate zsh)"

# Starship comes from mise, so initialise it after mise is active
(( $+commands[starship] )) && eval "$(starship init zsh)"
