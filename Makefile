SHELL = /bin/bash
HOMEBREW_PREFIX := $(shell bin/is-supported bin/is-arm64 /opt/homebrew /usr/local)
export XDG_CONFIG_HOME = $(HOME)/.config
export STOW_DIR = $(DOTFILES_DIR)
export ACCEPT_EULA=Y


brew:
	is-executable brew || curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install.sh | bash
