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
set backspace=indent,eol,start

if has("gui_running")
    set guioptions=-t
    set guifont=Monospace\ 14
    set lines=50 columns=200
endif

call plug#begin('~/.vim/plugged')
Plug 'ayu-theme/ayu-vim'
Plug 'tpope/vim-fugitive'
Plug 'scrooloose/nerdtree'
Plug 'mhinz/vim-startify'
Plug 'mbbill/undotree'
call plug#end()

let ayucolor="mirage"
colorscheme ayu

let mapleader=" "
nnoremap <leader>t :NERDTree<CR>
nnoremap <leader>g :Git<CR>
nnoremap <leader>u :UndotreeToggle<CR>

nnoremap <leader>h <c-W>h
nnoremap <leader>j <c-W>j
nnoremap <leader>k <c-W>k
nnoremap <leader>l <c-W>l

tnoremap <Esc> <C-w>
tnoremap <C-w>n <C-w>N
