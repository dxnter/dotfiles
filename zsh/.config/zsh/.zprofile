# Read once per login shell, after /etc/zprofile (path_helper). Builds PATH in one place.
# `typeset -U` keeps entries unique, and each entry is added only if the directory exists.

typeset -U path PATH
_prepend() { [[ -d "$1" ]] && path=("$1" $path) }
_append()  { [[ -d "$1" ]] && path=($path "$1") }

_prepend /usr/local/bin
_prepend /opt/homebrew/sbin
_prepend /opt/homebrew/bin

# Global installs from mise-managed runtimes: go install, cargo install, bun add -g, pnpm add -g, Composer
_append  "${GOPATH}/bin"
_prepend "${HOME}/.cargo/bin"
_prepend "${BUN_INSTALL}/bin"
_prepend "${PNPM_HOME}"
_prepend "${HOME}/.config/composer/vendor/bin"

# Herd provides PHP and Composer
_prepend "${HOME}/Library/Application Support/Herd/bin"

# mise shims: runtimes for GUI apps, IDEs and scripts. Interactive shells also run `mise activate` in .zshrc.
_prepend "${XDG_DATA_HOME}/mise/shims"

# Own tools last so they win
_prepend "${DOTFILES_DIR}/bin"
_prepend "${HOME}/.local/bin"

# OrbStack
[[ -f "${HOME}/.orbstack/shell/init.zsh" ]] && source "${HOME}/.orbstack/shell/init.zsh" 2>/dev/null

unfunction _prepend _append

# Installers append to ~/.zprofile, which zsh never reads once ZDOTDIR is set. Honour it anyway.
[[ "${ZDOTDIR}" != "${HOME}" && -f "${HOME}/.zprofile" ]] && source "${HOME}/.zprofile"
