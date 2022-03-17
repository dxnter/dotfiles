SHELL = /bin/bash
HOMEBREW_PREFIX := $(shell bin/is-supported bin/is-arm64 /opt/homebrew /usr/local)
export XDG_CONFIG_HOME = $(HOME)/.config
export ACCEPT_EULA=Y

setup:
		./system/setup.sh

gpg:
		./system/create_gpg_key.sh

links:
		./system/create_symlinks.sh



.PHONY: setup gpg links
