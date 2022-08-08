#!/usr/bin/env bash

if [ ! -x ~/.local/bin/rust-analyzer ]; then
  mkdir -p ~/.local/bin
  curl -L https://github.com/rust-lang/rust-analyzer/releases/latest/download/rust-analyzer-x86_64-unknown-linux-gnu.gz | gunzip -c - > ~/.local/bin/rust-analyzer
  chmod +x ~/.local/bin/rust-analyzer
else
  echo "Rust analyzer binary already installed at ~/.local/bin/rust-analyzer"
fi

