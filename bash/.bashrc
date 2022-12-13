# If not running interactively, don't do anything
case $- in
    *i*) ;;
      *) return;;
esac

# Source global definitions
if [ -f "/etc/bashrc" ]; then
	. "/etc/bashrc"
fi

# Set user specific environment
if ! [[ "$PATH" =~ "$HOME/.local/bin:$HOME/bin:" ]]
then
    PATH="$HOME/.local/bin:$HOME/bin:$PATH"
fi
export PATH

cmd()
{
  # Command exists and is executable
  command -v "$1" >/dev/null 2>&1
}

set -o vi

# Source cargo if installed
if [ -f "$HOME/.cargo/env" ]; then
	. "$HOME/.cargo/env"
fi

alias ls="ls --color=auto"
alias ll="ls -l"
alias la="ls -la"
alias ..="cd .."

cmd hx && EDITOR=hx
# cmd nvim && EDITOR=nvim && alias vi="nvim -u $HOME/.files/nvim/.config/nvim-tiny/init.lua --noplugin"
cmd exa && alias ls="exa" && alias ll="exa -l" && alias la="exa -la"
cmd bat && alias cat="bat"
cmd joshuto && alias ranger="joshuto"
cmd dust && alias du="dust"
cmd btm && alias top="btm"
cmd lazygit && alias lg="lazygit"
cmd zoxide && eval "$(zoxide init bash)"
cmd starship && eval "$(starship init bash)"
# cmd zellij && [ -z "${ZELLIJ}" ] && zellij
