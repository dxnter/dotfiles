# Enable Powerlevel10k instant prompt
if [[ -r "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh" ]]; then
  source "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh"
fi

# Start Fig Environment Variables
[ -s ~/.fig/shell/pre.sh ] && source ~/.fig/shell/pre.sh

# -----------------------------------------------------------------------------------
#                          EXPORTS PATHS                                            |
# -----------------------------------------------------------------------------------
# oh-my-zsh extension for zsh
export ZSH="/Users/dannyfoster/.oh-my-zsh"
# Composer
export PATH=$PATH:~/.composer/vendor/bin
# pyenv
export PATH="/home/dxnter/.pyenv/bin:$PATH:$HOME/.pyenv/versions/:$PATH"
export PYENV_VIRTUALENV_DISABLE_PROMPT=1
# nvm & zsh-nvm
export NVM_DIR="$HOME/.nvm"
export NVM_LAZY_LOAD=true
export NVM_COMPLETION=true

# -----------------------------------------------------------------------------------
#                          OTHER CONFIGURATIONS                                     |
# -----------------------------------------------------------------------------------
# Set zsh theme
ZSH_THEME="powerlevel10k/powerlevel10k"

plugins=(
  git
  zsh-nvm
  zsh-syntax-highlighting
  zsh-autosuggestions
)

# Enable fzf
[ -f ~/.fzf.zsh ] && source ~/.fzf.zsh

# Enable pyenv & virtualenv
eval "$(pyenv init -)"
eval "$(pyenv virtualenv-init -)"

# Enable oh-my-zsh
source $ZSH/oh-my-zsh.sh

# -----------------------------------------------------------------------------------
#                          ALIASES                                                  |
# -----------------------------------------------------------------------------------
# Chage and update ~/.zshrc
alias change="code ~/.zshrc"
alias update="source ~/.zshrc"
# LSD
alias ls="lsd"
alias l="ls"
alias ll="ls -l"
alias la="ls -a"
alias lla="ls -la"
alias lt="ls --tree"
# Extra
alias c="clear"
alias grep="rg"
alias cat="bat"
alias diff="delta"

# -----------------------------------------------------------------------------------
#                          FINAL SOURCES                                            |
# -----------------------------------------------------------------------------------

[[ ! -f ~/.p10k.zsh ]] || source ~/.p10k.zsh

# End Fig Environment Variables
[ -s ~/.fig/fig.sh ] && source ~/.fig/fig.sh

# Enable Starship prompt
eval "$(starship init zsh)"

# -----------------------------------------------------------------------------------
