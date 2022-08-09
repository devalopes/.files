# .bashrc

# Source global definitions
if [ -f /etc/bashrc ]; then
	. /etc/bashrc
fi

set -o vi

if [ -f $HOME/.cargo/env ]; then
	. "$HOME/.cargo/env"
fi

if [ -x $HOME/.local/bin/hx ]; then
	EDITOR=hx
fi

if [ -x /usr/bin/fish ]; then
	fish
fi
