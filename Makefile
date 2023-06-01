SHELL = /bin/bash
DOTFILES_DIR = $(shell pwd)
PATH := $(DOTFILES_DIR)/bin:$(PATH)
HOMEBREW_PREFIX := $(shell bin/is-supported bin/is-arm64 /opt/homebrew /usr/local)
export XDG_CONFIG_HOME = $(HOME)/.config
export ACCEPT_EULA=Y

setup:
		./system/setup.sh

backup:
		./system/backup.sh

ssh:
		./system/set_github_ssh_key.sh

gpg:
		./system/create_gpg_key.sh

links:
		./system/create_symlinks.sh

unlink:
		./system/remove_symlinks.sh

prefs:
		./system/preferences/main.sh

.PHONY: setup backup ssh gpg links unlink prefs
