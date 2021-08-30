export TMPDIR=$HOME/.tmp/
export EDITOR=nvim
export VISUAL=nvim
export HIGHLIGHT_STYLE=moria
export PATH=~/.local/bin:$PATH

set -o vi

if [[ -f $HOME/.cargo/env ]]
then
    . "$HOME/.cargo/env"
fi

source $HOME/.config/.git-prompt.sh
source $HOME/.config/.aliases
source $HOME/.config/.functions

export PS1='\[\e]0;\u@\h: \w\a\]\n${debian_chroot:+($debian_chroot)}\[\033[01;32m\]\u@\h\[\033[00m\]:\[\033[01;34m\]\w\[\033[00m\]$(__git_ps1)\$ '
