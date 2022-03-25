# Fig pre block. Keep at the top of this file.
export PATH="${PATH}:${HOME}/.local/bin"
eval "$(fig init zsh pre)"

if [[ -r "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh" ]]; then
  source "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh"
fi

# -----------------------------------------------------------------------------------
#                          OTHER CONFIGURATIONS                                     |
# -----------------------------------------------------------------------------------
ZSH_THEME="powerlevel10k/powerlevel10k"

plugins=(
  asdf
  git
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
# -----------------------------------------------------------------------------------

# Fig post block. Keep at the bottom of this file.
eval "$(fig init zsh post)"
