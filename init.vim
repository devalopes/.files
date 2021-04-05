syntax on

" set relativenumber
set nu
set nohlsearch
set hidden
set noerrorbells
set tabstop=4 softtabstop=4
set shiftwidth=4
set expandtab
set smartindent
set nowrap
set noswapfile
set nobackup
set undodir=~/.vim/undodir
set undofile
set incsearch
set scrolloff=8
set colorcolumn=80
" set signcolumn=yes
set termguicolors
set mouse=a

call plug#begin('~/.vim/plugged')
Plug 'ayu-theme/ayu-vim'

call plug#end()

let ayucolor="mirage"
colorscheme ayu

let mapleader=" "
