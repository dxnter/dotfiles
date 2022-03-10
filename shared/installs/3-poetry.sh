#!/usr/bin/env bash

if type poetry >/dev/null 2>&1; then
  echo "[-] Poetry already installed => skipping"
else
  echo "[-] Installing poetry"
  curl -sSL https://install.python-poetry.org | python3 -
fi
