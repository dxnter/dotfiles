#!/usr/bin/env bash
source './shared/utils.sh'

# xcode_install : Installs Xcode Command Line Tools

xcode_install() {
  xcode-select --install &> /dev/null
	while ! xcode-select -p &> /dev/null; do
	  sleep 5
	done
	print_success 'Xcode Command Line Tools installed'
}

xcode_install
