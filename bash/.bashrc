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

cmd()
{
  command -v "$1" >/dev/null 2>&1
}

set -o vi

# Source cargo if installed
if [ -f $HOME/.cargo/env ]; then
	. "$HOME/.cargo/env"
fi

cmd hx && EDITOR=hx
cmd nvim && EDITOR=nvim
cmd fish && fish

alias ls="ls --color=auto"
alias ll="ls -l"
alias la="ls -la"
