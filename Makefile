
export ACCEPT_EULA=Y
SHELL := /bin/bash
DOTFILES_ROOT := `pwd -P`


brew:
	is-executable brew || curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install.sh | bash
