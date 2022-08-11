# .bashrc

# If not running interactively, don't do anything
case $- in
    *i*) ;;
      *) return;;
esac

# Source global definitions
if [ -f /etc/bashrc ]; then
	. /etc/bashrc
fi

# User specific environment
if ! [[ "$PATH" =~ "$HOME/.local/bin:$HOME/bin:" ]]
then
    PATH="$HOME/.local/bin:$HOME/bin:$PATH"
fi
export PATH

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
