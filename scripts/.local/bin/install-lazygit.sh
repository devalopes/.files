#!/usr/bin/env bash

if [ ! -x ~/.local/bin/lazygit ]; then
  mkdir -p ~/.local/bin
  TARFILE=$(curl -s https://api.github.com/repos/jesseduffield/lazygit/releases/latest | grep 'browser_download_url.*Linux_x86_64.tar.gz' | cut -d : -f 2,3 | tr -d \")
  curl -L $TARFILE --output lazygit.tar.gz
  tar -xvf lazygit.tar.gz --directory ~/.local/bin
  rm -f lazygit.tar.gz
  rm -f LICENSE
  rm -f README.md
  chmod +x ~/.local/bin/lazygit
else
  echo "lazygit binary already installed at ~/.local/bin/lazygit"
fi

