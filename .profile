if [[ "$TERM" != "screen-256color" && -z "${NVIM_LISTEN_ADDRESS}" ]]
then
    # Don't run again if already in tmux OR in an nvim interactive shell
    tmux -u -2 new-session -A -s dev
fi

export TMPDIR=$HOME/.tmp/
export EDITOR=nvim
export VISUAL=nvim
export PORT=8080
export HIGHLIGHT_STYLE=moria
export PATH=~/.local/bin:~/Applications/:$PATH
if [[ $(uname -r) =~ [Mm]icrosoft ]]
    # Running in WSL (hopefully wsl2) export display server
then
    export DISPLAY=$(awk '/nameserver / {print $2; exit}' /etc/resolv.conf 2>/dev/null):0
    export LIBGL_ALWAYS_INDIRECT=1
fi

set -o vi

if [[ -f $HOME/.cargo/env ]]
then
    # Source cargo env for rustlang
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
