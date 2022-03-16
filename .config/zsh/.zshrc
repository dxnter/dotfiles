
if [[ "$OSTYPE" == "darwin"* ]]; then
  # Start Fig Environment Variables
  eval "$(fig init zsh pre)"
  [ -s ~/.fig/shell/pre.sh ] && source ~/.fig/shell/pre.sh
fi

if [[ -r "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh" ]]; then
  source "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh"
fi

# -----------------------------------------------------------------------------------
#                          OTHER CONFIGURATIONS                                     |
# -----------------------------------------------------------------------------------
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

[ -f $ZDOTDIR/.zsh_profile ] && source $ZDOTDIR/.zsh_profile


# -----------------------------------------------------------------------------------
#                          FINAL SOURCES                                            |
# -----------------------------------------------------------------------------------

[[ ! -f $ZDOTDIR/.p10k.zsh ]] || source $ZDOTDIR/.p10k.zsh
typeset -g POWERLEVEL9K_INSTANT_PROMPT=quiet

if [[ "$OSTYPE" == "darwin"* ]]; then
  # End Fig Environment Variables
  [ -s ~/.fig/fig.sh ] && source ~/.fig/fig.sh
  # Fig post block. Keep at the bottom of this file.
  eval "$(fig init zsh post)"
  fi

# -----------------------------------------------------------------------------------
