#!/usr/bin/env bash

if type rustc >/dev/null 2>&1; then
  echo "[-] Rust already installed => skipping"
else
  echo "[-] Installing Rust"
  curl --proto '=https' --tlsv1.2 -sSf https://sh.rustup.rs | sh
  rustc --version
fi
