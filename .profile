# tmux -u -2 new-session -A -s dev

export TMPDIR=$HOME/.tmp/
export EDITOR=nvim
export VISUAL=nvim
export PORT=8080
export HIGHLIGHT_STYLE=moria
export PATH=~/.local/bin:~/Applications/:$PATH

set -o vi

if [[ -f $HOME/.cargo/env ]]
then
    . "$HOME/.cargo/env"
fi

source $HOME/.config/.git-prompt.sh
source $HOME/.config/.aliases
source $HOME/.config/.functions


function set_prompt() {
  export GIT_PS1_SHOWDIRTYSTATE=1
  red=$(tput setaf 1)
  green=$(tput setaf 2)
  yellow=$(tput setaf 3)
  blue=$(tput setaf 4)
  magenta=$(tput setaf 5)
  cyan=$(tput setaf 6)
  white=$(tput setaf 7)
  reset=$(tput sgr0)
  if [[ $EUID -eq 0 ]]
  then
     PS1='\[$red\]\u\[$reset\]'
  else
     PS1='\[$cyan\]\u\[$reset\]'
  fi
  PS1+='\[$magenta\]@\[$reset\]\[$cyan\]\h\[$reset\]\[$magenta\]:\[$reset\]\[$blue\]\W\[$reset\]\[$green\]$(__git_ps1)\[$reset\]\[$magenta\]$\[$reset\] '
  export PS1
}
set_prompt
