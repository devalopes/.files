#!/usr/bin/env bash

if [ ! -x ~/.local/bin/zellij ]; then
  mkdir -p ~/.local/bin
  curl -L https://github.com/zellij-org/zellij/releases/latest/download/zellij-x86_64-unknown-linux-musl.tar.gz --output zellij.tar.gz
  tar -xvf zellij.tar.gz --directory ~/.local/bin
  rm zellij.tar.gz
  chmod +x ~/.local/bin/zellij
else
  echo "Zellij binary already installed at ~/.local/bin/zellij"
fi

