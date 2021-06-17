set path+=**
syntax on

set nu
set cursorline
set nohlsearch
set hidden
set noerrorbells
set tabstop=4 softtabstop=4
set shiftwidth=4
set expandtab
set smartindent
set ignorecase
set noshowmode
set nowrap
set noswapfile
set nobackup
set undodir=~/.vim/undodir
set undofile
set incsearch
set scrolloff=10
set colorcolumn=80
set signcolumn=yes
set mouse=a
set backspace=indent,eol,start
set completeopt=menuone,noinsert,noselect
set shortmess+=c

set wildignore+=*.pyc
set wildignore+=**/node_modules/*
set wildignore+=**/.git/*

call plug#begin('~/.vim/plugged')
Plug 'mhinz/vim-startify'
Plug 'hoob3rt/lualine.nvim'
Plug 'kyazdani42/nvim-web-devicons'
Plug 'folke/tokyonight.nvim'
Plug 'tpope/vim-fugitive'
Plug 'tpope/vim-commentary'
Plug 'mbbill/undotree'
Plug 'nvim-lua/plenary.nvim'
Plug 'nvim-lua/popup.nvim'
Plug 'kevinhwang91/rnvimr'
Plug 'lewis6991/gitsigns.nvim'
Plug 'voldikss/vim-floaterm'
Plug 'nvim-treesitter/nvim-treesitter', {'do': ':TSUpdate'}
Plug 'nvim-telescope/telescope.nvim'
Plug 'neovim/nvim-lspconfig'
Plug 'nvim-lua/completion-nvim'

" Testing
Plug 'folke/which-key.nvim'
call plug#end()

set termguicolors
let g:tokyonight_style = "night"
colorscheme tokyonight
highlight Normal guibg=None
" highlight ColorColumn guibg=black
" highlight CursorLine guibg=None
" highlight SignColumn guibg=None
" highlight LineNr guibg=None guifg=Gray

" let g:nvim_tree_ignore = [ '.git', 'node_modules', '.cache' ] "empty by default
" let g:nvim_tree_auto_close = 1 "0 by default, closes the tree when it's the last window
" let g:nvim_tree_git_hl = 1 "0 by default, will enable file highlight for git attributes (can be used without the icons).
" let g:nvim_tree_special_files = [ 'README.md', 'Makefile', 'MAKEFILE' ] " List of filenames that gets highlighted with NvimTreeSpecialFile
" let g:nvim_tree_follow = 1 "0 by default, this option allows the cursor to be updated when entering a buffer
let g:rnvimr_enable_ex = 1 " Make Ranger replace Netrw and be the file explorer
let g:rnvimr_hide_gitignore = 1 " Hide the files included in gitignore
let g:rnvimr_enable_bw = 1 " Make Neovim wipe the buffers corresponding to the files deleted by Ranger

let mapleader=" "
nnoremap q: <nop>
nnoremap Q <nop>
nnoremap <leader>wq :wq<CR>
nnoremap <leader>w :w<CR>
nnoremap <leader>q :q<CR>
nnoremap <leader>Q :q!<CR>
nnoremap <leader>vrc :e ~/.config/nvim/init.vim<CR>
tnoremap <Esc> <C-w><CR>
tnoremap <C-w>n <C-w>N

nnoremap <leader>ft :FloatermToggle<CR>
tnoremap <leader>ft <C-\><C-n>:FloatermToggle<CR>
" nnoremap <leader>tt :NvimTreeToggle<CR>
" nnoremap <leader>tr :NvimTreeRefresh<CR>
nnoremap <leader>t :RnvimrToggle<CR>
nnoremap <leader>g :Git<CR>
nnoremap <leader>ut :UndotreeToggle<CR>
nnoremap <leader>ff <cmd>Telescope find_files<cr>
nnoremap <leader>fg <cmd>Telescope live_grep<cr>
nnoremap <leader>fb <cmd>Telescope buffers<cr>
nnoremap <leader>fh <cmd>Telescope help_tags<cr>
" Use <Tab> and <S-Tab> to navigate through popup menu
inoremap <expr> <Tab>   pumvisible() ? "\<C-n>" : "\<Tab>"
inoremap <expr> <S-Tab> pumvisible() ? "\<C-p>" : "\<S-Tab>"


augroup remove_whitespace
    autocmd!
    autocmd BufWritePre * %s/\s\+$//e
augroup END

autocmd BufEnter * lua require'completion'.on_attach()

lua <<EOF

-- Testing
require('which-key').setup{}
--Testing

require('lualine').setup {
  options = {
    theme = 'tokyonight'
  }
}

require('gitsigns').setup()

require'nvim-treesitter.configs'.setup {
    highlight = {
        enable = true,
    },
    indent = {
        enable = true,
    },
}

-- LSP --
local nvim_lsp = require('lspconfig')

-- Use an on_attach function to only map the following keys
-- after the language server attaches to the current buffer
local on_attach = function(client, bufnr)
local function buf_set_keymap(...) vim.api.nvim_buf_set_keymap(bufnr, ...) end
local function buf_set_option(...) vim.api.nvim_buf_set_option(bufnr, ...) end

  --Enable completion triggered by <c-x><c-o>
--  buf_set_option('omnifunc', 'v:lua.vim.lsp.omnifunc')

  -- Mappings.
  local opts = { noremap=true, silent=true }

  -- See `:help vim.lsp.*` for documentation on any of the below functions
  buf_set_keymap('n', 'gD', '<Cmd>lua vim.lsp.buf.declaration()<CR>', opts)
  buf_set_keymap('n', 'gd', '<Cmd>lua vim.lsp.buf.definition()<CR>', opts)
  buf_set_keymap('n', '<space>h', '<Cmd>lua vim.lsp.buf.hover()<CR>', opts)
  buf_set_keymap('n', 'gi', '<cmd>lua vim.lsp.buf.implementation()<CR>', opts)
--  buf_set_keymap('n', '<space>s', '<cmd>lua vim.lsp.buf.signature_help()<CR>', opts)
--  buf_set_keymap('n', '<space>wa', '<cmd>lua vim.lsp.buf.add_workspace_folder()<CR>', opts)
--  buf_set_keymap('n', '<space>wr', '<cmd>lua vim.sp.buf.remove_workspace_folder()<CR>', opts)
--  buf_set_keymap('n', '<space>wl', '<cmd>lua print(vim.inspect(vim.lsp.buf.list_workspace_folders()))<CR>', opts)
  buf_set_keymap('n', '<space>x', '<cmd>lua vim.lsp.buf.type_definition()<CR>', opts)
  buf_set_keymap('n', '<space>rn', '<cmd>lua vim.lsp.buf.rename()<CR>', opts)
--  buf_set_keymap('n', '<space>ca', '<cmd>lua vim.lsp.buf.code_action()<CR>', opts)
  buf_set_keymap('n', 'gr', '<cmd>lua vim.lsp.buf.references()<CR>', opts)
  buf_set_keymap('n', 'grp', '<cmd>cp<CR>', opts)
  buf_set_keymap('n', 'grn', '<cmd>cn<CR>', opts)
  buf_set_keymap('n', 'grc', '<cmd>ccl<CR>', opts)
  buf_set_keymap('n', '<space>s', '<cmd>lua vim.lsp.diagnostic.show_line_diagnostics()<CR>', opts)
--  buf_set_keymap('n', '<space>cp', '<cmd>lua vim.lsp.diagnostic.goto_prev()<CR>', opts)
--  buf_set_keymap('n', '<space>cn', '<cmd>lua vim.lsp.diagnostic.goto_next()<CR>', opts)
  buf_set_keymap('n', '<space>cc', '<cmd>lua vim.lsp.diagnostic.set_loclist()<CR>', opts)
-- buf_set_keymap("n", "<space>fm", "<cmd>lua vim.lsp.buf.formatting()<CR>", opts)
end

vim.lsp.handlers["textDocument/publishDiagnostics"] =
    vim.lsp.with(vim.lsp.diagnostic.on_publish_diagnostics, {
        underline = false,
        virtual_text = false,
        signs = true,
        update_in_insert = false
    })

-- Use a loop to conveniently call 'setup' on multiple servers and
-- map buffer local keybindings when the language server attaches
local servers = { "pyright", "rust_analyzer"}
for _, lsp in ipairs(servers) do
  nvim_lsp[lsp].setup { on_attach = on_attach }
end
-- LSP --

EOF
