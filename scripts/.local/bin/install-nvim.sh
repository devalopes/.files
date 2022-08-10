#!/usr/bin/env bash

if [ ! -x ~/.local/bin/nvim ]; then
  mkdir -p ~/.local/bin
  curl -L https://github.com/neovim/neovim/releases/latest/download/nvim.appimage --output ~/.local/bin/nvim
  chmod +x ~/.local/bin/nvim
else
  echo "Neovim binary already installed at ~/.local/bin/nvim"
fi

