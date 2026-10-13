SHELL = /bin/bash
export DOTFILES_DIR := $(CURDIR)
export XDG_CONFIG_HOME = $(HOME)/.config

setup:
		./system/setup.sh

brew:
		./system/installs/brew.sh

mise:
		./system/installs/mise.sh

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

.PHONY: setup brew mise backup ssh gpg links unlink prefs
