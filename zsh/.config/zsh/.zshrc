# Interactive shells only.

# File-name colors for lsd and completion lists, as ANSI codes so they follow the Ghostty theme:
# blue folders, green executables, purple symlinks. Set before oh-my-zsh, which only fills in a default.
export LS_COLORS="di=1;34:ln=35:so=32:pi=33:ex=1;32:bd=34;46:cd=34;43:su=30;41:sg=30;46:tw=30;42:ow=30;43"

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

# fzf-tab: use FZF_DEFAULT_OPTS (.zshenv) and preview folders with lsd, files with bat
zstyle ':fzf-tab:*' use-fzf-default-opts yes
zstyle ':fzf-tab:*' fzf-pad 4  # room for the border from FZF_DEFAULT_OPTS
zstyle ':fzf-tab:complete:(cd|ls|lsd|cat|bat|code|nvim|vim|less):*' fzf-preview \
  '[[ -d $realpath ]] && lsd -1 --color=always --icon=always $realpath || bat --color=always --style=numbers --line-range=:200 $realpath'

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

# Herd's nvm takes ~1 s to load, and mise already provides Node (switching on .nvmrc too).
# Load nvm only when it's called. Keep `source nvm.sh` lines out of ~/.zshrc for this to help.
if [[ -s "${NVM_DIR}/nvm.sh" ]] && (( ! $+functions[nvm] )); then
  nvm() { unfunction nvm; source "${NVM_DIR}/nvm.sh"; nvm "$@" }
fi

# mise last: its prompt hook re-asserts mise's runtimes ahead of anything the files above put on PATH (e.g. Herd's nvm)
(( $+commands[mise] )) && eval "$(mise activate zsh)"

# Starship comes from mise, so initialise it after mise is active
(( $+commands[starship] )) && eval "$(starship init zsh)"
