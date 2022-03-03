# Start Fig Environment Variables
[ -s ~/.fig/shell/pre.sh ] && source ~/.fig/shell/pre.sh

# Enable Powerlevel10k instant prompt
if [[ -r "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh" ]]; then
  source "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh"
fi


# -----------------------------------------------------------------------------------
#                          EXPORTS PATHS                                            |
# -----------------------------------------------------------------------------------
# oh-my-zsh extension for zsh
export ZSH="/Users/dannyfoster/.oh-my-zsh"
# Composer
export PATH=$PATH:~/.composer/vendor/bin
export LC_ALL=en_US.UTF-8
export GPG_TTY=$(tty)
# Rust
export PATH=$PATH:~/.cargo/bin
# pyenv
export PATH="/home/dxnter/.pyenv/bin:$PATH:$HOME/.pyenv/versions/:$PATH"
export PYENV_VIRTUALENV_DISABLE_PROMPT=1
# nvm & zsh-nvm
export NVM_DIR="$HOME/.nvm"
export NVM_LAZY_LOAD=true
export NVM_COMPLETION=true
# Dsiable zsh update prompt
export DISABLE_UPDATE_PROMPT=true

# -----------------------------------------------------------------------------------
#                          OTHER CONFIGURATIONS                                     |
# -----------------------------------------------------------------------------------
# Set zsh theme
ZSH_THEME="powerlevel10k/powerlevel10k"

plugins=(
  git
  zsh-syntax-highlighting
  zsh-autosuggestions
)

# Enable oh-my-zsh
source $ZSH/oh-my-zsh.sh

# Enable fzf
[ -f ~/.fzf.zsh ] && source ~/.fzf.zsh

# Enable pyenv & virtualenv
eval "$(pyenv init -)"
eval "$(pyenv virtualenv-init -)"

# Lazy load nvm
lazynvm() {
  unset -f nvm node npm npx
  export NVM_DIR=~/.nvm
  [ -s "$NVM_DIR/nvm.sh" ] && . "$NVM_DIR/nvm.sh" # This loads nvm
  if [ -f "$NVM_DIR/bash_completion" ]; then
    [ -s "$NVM_DIR/bash_completion" ] && \. "$NVM_DIR/bash_completion" # This loads nvm bash_completion
  fi
}

nvm() {
  lazynvm
  nvm $@
}

node() {
  lazynvm
  node $@
}

npm() {
  lazynvm
  npm $@
}

npx() {
  lazynvm
  npx $@
}

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

# End Fig Environment Variables
[ -s ~/.fig/fig.sh ] && source ~/.fig/fig.sh

[[ ! -f ~/.p10k.zsh ]] || source ~/.p10k.zsh
typeset -g POWERLEVEL9K_INSTANT_PROMPT=quiet


# -----------------------------------------------------------------------------------
