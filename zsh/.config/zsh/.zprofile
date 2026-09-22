# Read once per login shell, after /etc/zprofile (path_helper). Builds PATH in one place.
# `typeset -U` keeps entries unique, and each entry is added only if the directory exists.

typeset -U path PATH
_prepend() { [[ -d "$1" ]] && path=("$1" $path) }
_append()  { [[ -d "$1" ]] && path=($path "$1") }

_prepend /usr/local/bin
_prepend /opt/homebrew/sbin
_prepend /opt/homebrew/bin

# Go
[[ -d /opt/homebrew/opt/go/libexec ]] && export GOROOT=/opt/homebrew/opt/go/libexec
_append "${GOROOT}/bin"
_append "${GOPATH}/bin"

# Rust, Bun, pnpm, Composer
_prepend "${HOME}/.cargo/bin"
_prepend "${BUN_INSTALL}/bin"
_prepend "${PNPM_HOME}"
_prepend "${PNPM_HOME}/bin"          # standalone pnpm lives here, independent of the Node version
_prepend "${HOME}/.config/composer/vendor/bin"

# Herd: PHP first on PATH, plus the default Node without loading nvm
_prepend "${HOME}/Library/Application Support/Herd/bin"
if [[ -n "${NVM_DIR}" && -f "${NVM_DIR}/alias/default" ]]; then
  # Resolve the default alias (a version like "24", or a chain like lts/* -> lts/krypton -> v24.21.0)
  _nvm_want=$(<"${NVM_DIR}/alias/default")
  for _ in 1 2 3; do
    [[ -f "${NVM_DIR}/alias/${_nvm_want}" ]] && _nvm_want=$(<"${NVM_DIR}/alias/${_nvm_want}") || break
  done
  _nvm_dirs=("${NVM_DIR}"/versions/node/v${_nvm_want#v}*(N/))
  _nvm_dirs=(${(On)_nvm_dirs})                       # highest version first
  (( ${#_nvm_dirs} )) && _prepend "${_nvm_dirs[1]}/bin"
  unset _nvm_want _nvm_dirs
fi

# Own tools last so they win
_prepend "${DOTFILES_DIR}/bin"
_prepend "${HOME}/.local/bin"

# GUI-app CLIs
_append "${HOME}/Library/Application Support/JetBrains/Toolbox/scripts"
[[ -f "${HOME}/.orbstack/shell/init.zsh" ]] && source "${HOME}/.orbstack/shell/init.zsh" 2>/dev/null

unfunction _prepend _append

# Installers append to ~/.zprofile, which zsh never reads once ZDOTDIR is set. Honour it anyway.
[[ "${ZDOTDIR}" != "${HOME}" && -f "${HOME}/.zprofile" ]] && source "${HOME}/.zprofile"
