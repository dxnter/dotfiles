# CodeWhisperer pre block. Keep at the top of this file.
[[ -f "${HOME}/Library/Application Support/codewhisperer/shell/zshrc.pre.zsh" ]] && builtin source "${HOME}/Library/Application Support/codewhisperer/shell/zshrc.pre.zsh"

# -----------------------------------------------------------------------------------
#                          OTHER CONFIGURATIONS                                     |
# -----------------------------------------------------------------------------------
plugins=(
  asdf
  git
  macos
  composer
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
# -----------------------------------------------------------------------------------

eval "$(starship init zsh)"

test -e "${ZDOTDIR}/.iterm2_shell_integration.zsh" && source "${ZDOTDIR}/.iterm2_shell_integration.zsh"


[ -s "/Users/dannyfoster/.bun/_bun" ] && source "/Users/dannyfoster/.bun/_bun"

# CodeWhisperer post block. Keep at the bottom of this file.
[[ -f "${HOME}/Library/Application Support/codewhisperer/shell/zshrc.post.zsh" ]] && builtin source "${HOME}/Library/Application Support/codewhisperer/shell/zshrc.post.zsh"
