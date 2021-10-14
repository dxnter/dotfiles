export ZSH="/home/dxnter/.oh-my-zsh"

export PYENV_VIRTUALENV_DISABLE_PROMPT=1

ZSH_THEME="spaceship"

plugins=(
  git
  zsh-syntax-highlighting
  zsh-autosuggestions
)

source $ZSH/oh-my-zsh.sh

alias change="code ~/.zshrc"
alias update="source ~/.zshrc"

# Alias for lsd
alias ls="lsd"
alias l="ls"
alias ll="ls -l"
alias la="ls -a"
alias lla="ls -la"
alias lt="ls --tree"

# Other aliases
alias c="clear"
alias grep="rg"
alias cat="batcat"
alias diff="delta"


export PATH="/home/dxnter/.pyenv/bin:$PATH:$HOME/.pyenv/versions/:$PATH"
eval "$(pyenv init -)"
eval "$(pyenv virtualenv-init -)"

export NVM_DIR="$HOME/.nvm"
[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"  # This loads nvm
[ -s "$NVM_DIR/bash_completion" ] && \. "$NVM_DIR/bash_completion"  # This loads nvm bash_completion
