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
_prepend "${HOME}/.config/composer/vendor/bin"

# Herd: PHP first on PATH, plus the default Node without loading nvm
_prepend "${HOME}/Library/Application Support/Herd/bin"
if [[ -n "${NVM_DIR}" && -f "${NVM_DIR}/alias/default" ]]; then
  _nvm_default=$(command ls -d "${NVM_DIR}/versions/node/v$(<"${NVM_DIR}/alias/default")"* 2>/dev/null | sort -V | tail -1)
  [[ -n "${_nvm_default}" ]] && _prepend "${_nvm_default}/bin"
  unset _nvm_default
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
