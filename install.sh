#!/usr/bin/env bash
# Short install script for all dotfiles
# Should be re-run any time there is a change to a file

############################ Constants ########################################

RED='\033[0;31m'
GREEN='\033[0;32m'
NC='\033[0m'
SCRIPT_DIR="$( cd "$( dirname "${BASH_SOURCE[0]}" )" &> /dev/null && pwd )"

############################ Helper Functions #################################

install() {
	read -p "Install $1 config? (y/n/q) " -n 1 -r
	echo -e "\n"
	if [[ $REPLY =~ ^[Qq]$ ]]
	then
		exit 1
	fi
	if [[ $REPLY =~ ^[Yy]$ ]]
	then
		$1
	fi
}

exists() {
	[[ "$(command -v $1 )" ]] || { echo -e "${RED}$1 is not installed${NC}" 1>&2 ; exit 1; }
}

install_success() {
	echo -e ${GREEN}$1 config installed successfully${NC}
}

# copy() {
# 	DIR="$(dirname $2)"
# 	mkdir -pv "${DIR}" && cp -fv $SCRIPT_DIR/$1 $2
# }

link() {
	DIR="$(dirname $2)"
	mkdir -pv "${DIR}" && ln -sfv $SCRIPT_DIR/$1 $2
}


########################### Installation Functions ############################

kitty() {
	exists kitty
	link kitty/kitty.conf $HOME/.config/kitty/kitty.conf
    link kitty/selenized_day.conf $HOME/.config/kitty/themes/selenized_day.conf
	install_success kitty
}


neovim() {
	if [[ ! "$(command -v nvim )" ]]
	then
		mkdir -pv $HOME/Applications
		curl -L https://github.com/neovim/neovim/releases/latest/download/nvim.appimage -o $HOME/Applications/nvim
		chmod u+x $HOME/Applications/nvim
	fi
	exists nvim
    # Add Plug if it doesn't exist
	if [[ ! -f ${XDG_DATA_HOME:-$HOME/.local/share}/nvim/site/autoload/plug.vim ]]
	then
		sh -c 'curl -fLo "${XDG_DATA_HOME:-$HOME/.local/share}"/nvim/site/autoload/plug.vim --create-dirs \
	       https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim'
	fi
	link init.vim $HOME/.config/nvim/init.vim
    # language server for python
    exists npm
    npm list -g pyright | grep "pyright" || sudo npm install --global pyright
    # language server for rust
    if [[ ! -f $HOME/.local/bin/rust-analyzer ]]
    then
        mkdir -pv $HOME/.local/bin
        curl -L https://github.com/rust-analyzer/rust-analyzer/releases/latest/download/rust-analyzer-x86_64-unknown-linux-gnu.gz | gunzip -c - > $HOME/.local/bin/rust-analyzer
        chmod +x $HOME/.local/bin/rust-analyzer
    fi
    nvim +PlugInstall +qa  # Silently execute PlugInstall
	install_success neovim
}

ranger() {
	exists ranger
	link rifle.conf $HOME/.config/ranger/rifle.conf
    pip install ranger-fm
	install_success ranger
}

profile() {
    # Some common directories used in profile
    if [[ ! -d $HOME/.tmp ]]
    then
        mkdir -pv $HOME/.tmp
    fi
    if [[ ! -d $HOME/.Trash ]]
    then
        mkdir -pv $HOME/.Trash
    fi

    # .bash_profile / .bash_login interfere with .profile sourcing on startup
    if [[ -f $HOME/.bash_profile ]]
    then
        rm -f $HOME/.bash_profile
    fi
    if [[ -f $HOME/.bash_login ]]
    then
        rm -f $HOME/.bash_login
    fi

    link .git-prompt.sh $HOME/.config/.git-prompt.sh
    link .profile $HOME/.profile
	install_success profile
}

aliases() {
    link .aliases $HOME/.config/.aliases
	install_success aliases
}

functions() {
    link .functions $HOME/.config/.functions
	install_success functions
}


gitconfig() {
    link .gitconfig $HOME/.gitconfig
	install_success gitconfig
}

bashrc() {
    link .bashrc $HOME/.bashrc
    install_success bashrc
}

install aliases
install functions
install profile
install bashrc
install gitconfig
install kitty
install neovim
install ranger
