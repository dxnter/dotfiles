if [[ "$OSTYPE" == "darwin"* ]]; then
  # Start Fig Environment Variables
  [ -s ~/.fig/shell/pre.sh ] && source ~/.fig/shell/pre.sh
fi

if [[ -r "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh" ]]; then
  source "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh"
fi

# -----------------------------------------------------------------------------------
#                          EXPORTS PATHS                                            |
# -----------------------------------------------------------------------------------
export ZSH="$HOME/.oh-my-zsh"

export DISABLE_UPDATE_PROMPT=true
export TERM=xterm-256color
export GPG_TTY=$(tty)
export LC_ALL=en_US.UTF-8
export LANG=en_US.UTF-8
export DISABLE_UPDATE_PROMPT=true


# -----------------------------------------------------------------------------------
#                          OTHER CONFIGURATIONS                                     |
# -----------------------------------------------------------------------------------
# Set zsh theme
ZSH_THEME="powerlevel10k/powerlevel10k"

plugins=(
  git
  asdf
  zsh-syntax-highlighting
  zsh-autosuggestions
)

# Enable oh-my-zsh
source $ZSH/oh-my-zsh.sh

# Enable fzf
[ -f ~/.fzf.zsh ] && source ~/.fzf.zsh

# -----------------------------------------------------------------------------------
#                          FINAL SOURCES                                            |
# -----------------------------------------------------------------------------------

[[ ! -f ~/.p10k.zsh ]] || source ~/.p10k.zsh
typeset -g POWERLEVEL9K_INSTANT_PROMPT=quiet

if [[ "$OSTYPE" == "darwin"* ]]; then
  # End Fig Environment Variables
  [ -s ~/.fig/fig.sh ] && source ~/.fig/fig.sh
fi

# -----------------------------------------------------------------------------------
