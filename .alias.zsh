# Editors
alias vim="nvim"
alias vi="nvim"

# Languages
alias python="/opt/homebrew/bin/python3.9"

# General
alias ..="cd .."
alias ls="ls -lG --color=auto"
alias la="ls -la --color=auto"
alias l="ls"
alias grep="grep --color=auto --exclude-dir={.bzr,CVS,.git,.hg,.svn,.idea,.tox}"
alias untar="untar -xzvf"
alias trash="ls -laG ~/.Trash"
alias rm="rm -i"
alias mv="mv -i"

# Networking
alias head="curl -I"
alias myip="curl https://ifconfig.me"
alias localip="ipconfig getifaddr en0"
alias ping="ping -c 5"

# Find & Delete all ".DS_Store" files (recursive)
alias delete.ds="find . -name '.DS_Store' -type f -print -delete"

# Git aliases
alias gaa="git add -v --all"
alias ga="git add"
alias gf="git fetch -v"
alias gc="git commit -v -m"
alias gpush="git push -v"
alias gpull="git pull -v"
alias gs="git status"
alias gcb="git checkout -b"
alias gco="git checkout"
alias gb="git branch"
alias g="git"
alias gcfg="git config --list"
alias gcp="git cherry-pick"
alias gd="git diff"
alias gm="git merge"
alias gl="git log"
alias gr="git remote -v"
alias gra="git remote add"
alias gl="git log --decorate --graph --stat --all"

