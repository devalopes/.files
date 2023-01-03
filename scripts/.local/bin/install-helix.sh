#!/usr/bin/env bash

ARCHITECTURE=$(uname -m)

if [ ! -x ~/.local/bin/hx ]; then
  mkdir -p ~/.local/bin
  APPIMAGE=$(curl -s https://api.github.com/repos/helix-editor/helix/releases/latest | grep "browser_download_url.*$ARCHITECTURE.AppImage" | grep -v '.zsync' | cut -d : -f 2,3 | tr -d \")
  curl -L $APPIMAGE --output ~/.local/bin/hx
  chmod +x ~/.local/bin/hx
else
  echo "Helix already installed at ~/.local/bin/hx"
fi

