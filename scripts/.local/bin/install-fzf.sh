#!/usr/bin/env bash

if [ ! -x ~/.fzf ]; then
    git clone --depth 1 https://github.com/junegunn/fzf.git ~/.fzf
    ~/.fzf/install
else
  echo "fzf already installed at ~/.fzf"
fi

