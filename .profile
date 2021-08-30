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
  export PS1='\[$cyan\]\u\[$reset\]\[$magenta\]@\[$reset\]\[$cyan\]\h\[$reset\]\[$magenta\]:\[$reset\]\[$blue\]\w\[$reset\]\[$green\]$(__git_ps1)\[$reset\]\[$magenta\]$\[$reset\] '
}
set_prompt
