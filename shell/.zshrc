# Fig pre block. Keep at the top of this file.
export PATH="${PATH}:${HOME}/.local/bin"
eval "$(fig init zsh pre)"

if [[ "$OSTYPE" == "darwin"* ]]; then
  # Start Fig Environment Variables
  [ -s ~/.fig/shell/pre.sh ] && source ~/.fig/shell/pre.sh
fi

if [[ -r "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh" ]]; then
  source "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh"
fi

# -----------------------------------------------------------------------------------
#                          OTHER CONFIGURATIONS                                     |
# -----------------------------------------------------------------------------------
export ZSH="$HOME/.oh-my-zsh"

ZSH_THEME="powerlevel10k/powerlevel10k"

plugins=(
  git
  asdf
  fzf-tab
  zsh-syntax-highlighting
  zsh-autosuggestions
)

# Enable oh-my-zsh
source $ZSH/oh-my-zsh.sh

# Enable fzf
[ -f ~/.fzf.zsh ] && source ~/.fzf.zsh

[ -f ~/.zsh_profile ] && source ~/.zsh_profile


# -----------------------------------------------------------------------------------
#                          FINAL SOURCES                                            |
# -----------------------------------------------------------------------------------

[[ ! -f ~/.p10k.zsh ]] || source ~/.p10k.zsh
typeset -g POWERLEVEL9K_INSTANT_PROMPT=quiet

if [[ "$OSTYPE" == "darwin"* ]]; then
  # End Fig Environment Variables
  [ -s ~/.fig/fig.sh ] && source ~/.fig/fig.sh
  # Fig post block. Keep at the bottom of this file.
  fi

# -----------------------------------------------------------------------------------

# Fig post block. Keep at the bottom of this file.
eval "$(fig init zsh post)"
