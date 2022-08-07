# .files
This repository uses [`GNU Stow`](https://www.gnu.org/software/stow/manual/html_node/index.html) to manage symlinks to all of the above configuration files.

## How To
* `cd` into `.files/`
* `make`

## Example Structure
Stow uses the directory hierarchy for the link target, as such a hierarchy mimicking the destination is required 

```
.
├── alacritty
│   └── .config
│       └── alacritty
│           └── alacritty.yml
├── fish
│   └── .config
│       └── fish
│           └── config.fish
├── helix
│   └── .config
│       └── helix
│           └── config.toml
├── kitty
│   └── .config
│       └── kitty
│           ├── kitty.conf
│           ├── kitty-theme.conf
│           ├── selenized_day.conf
│           └── selenized_night.conf
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
