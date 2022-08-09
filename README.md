# .files
This repository uses [`GNU Stow`](https://www.gnu.org/software/stow/manual/html_node/index.html) to manage symlinks to all of the above configuration files.

## How To
* `git clone git@github.com:devalopes/.files.git`
* `cd .files/`
* `make`

## Example Structure
Stow uses the directory hierarchy for the link target, as such a hierarchy mimicking the destination is required 

```
.
├── alacritty
│   └── .config
│       └── alacritty
│           ├── alacritty.yml
│           └── nord.yml
├── bash
│   └── .bashrc
├── box
│   └── .config
│       ├── my-python-project
│       ├── python
│       │   └── docker-compose.yml
│       └── rust
│           └── Dockerfile
├── fish
│   └── .config
│       └── fish
│           └── config.fish
├── git
│   └── .gitconfig
├── helix
│   └── .config
│       └── helix
│           ├── config.toml
│           ├── hx
│           └── themes
│               └── nord.toml
├── kitty
│   └── .config
│       └── kitty
│           ├── kitty.conf
│           └── themes
│               ├── kitty-theme.conf
│               ├── nord.conf
│               ├── selenized_day.conf
│               └── selenized_night.conf
├── makefile
├── nvim
│   └── .config
│       └── nvim
│           ├── init.lua
│           └── lua
│               ├── colors.lua
│               ├── keymaps.lua
│               ├── plugins
│               │   └── packer.lua
│               └── settings.lua
├── README.md
├── scripts
│   └── .local
│       └── bin
│           ├── install-helix.sh
│           ├── install-kitty.sh
│           ├── install-rust-analyzer.sh
│           └── install-zellij.sh
├── .stow-local-ignore
├── tmux
│   └── .config
│       └── tmux
│           └── tmux.conf
└── zellij
    └── .config
        └── zellij
            └── config.yaml
```