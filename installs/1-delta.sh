#!/bin/bash

delta_version="0.12.0"

if type delta >/dev/null 2>&1; then
  echo "[-] delta already exists => skipping"
else
  echo "[-] installing delta: https://github.com/dandavison/delta/"
  curl -L -o /tmp/delta.deb https://github.com/dandavison/delta/releases/download/${delta_version}/git-delta_${delta_version}_amd64.deb
  sudo dpkg -i /tmp/delta.deb
fi
