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
set smartcase
set noshowmode
set nowrap
set noswapfile
set nobackup
set undofile
set incsearch
set scrolloff=10
set colorcolumn=80
set signcolumn=yes
set mouse=a
set backspace=indent,eol,start
set completeopt=menuone,noinsert,noselect
set shortmess+=c
set noshowcmd
set noruler
set clipboard+=unnamedplus

set wildignore+=*.pyc
set wildignore+=**/node_modules/*
set wildignore+=**/.git/*

call plug#begin('~/.vim/plugged')
Plug 'mhinz/vim-startify'
Plug 'hoob3rt/lualine.nvim'
Plug 'navarasu/onedark.nvim'
Plug 'norcalli/nvim-colorizer.lua'
Plug 'tpope/vim-fugitive'
Plug 'TimUntersberger/neogit'
Plug 'tpope/vim-commentary'
Plug 'mbbill/undotree'
Plug 'nvim-lua/plenary.nvim'
Plug 'nvim-lua/popup.nvim'
Plug 'kyazdani42/nvim-web-devicons'
Plug 'kevinhwang91/rnvimr'
Plug 'lewis6991/gitsigns.nvim'
Plug 'windwp/nvim-autopairs'
Plug '907th/vim-auto-save'
Plug 'onsails/lspkind-nvim'
Plug 'voldikss/vim-floaterm'
Plug 'nvim-treesitter/nvim-treesitter', {'do': ':TSUpdate'}
Plug 'nvim-telescope/telescope.nvim'
Plug 'neovim/nvim-lspconfig'
Plug 'hrsh7th/nvim-compe'
Plug 'folke/which-key.nvim'
Plug 'ray-x/lsp_signature.nvim'

" Test plugins
Plug 'lukas-reineke/indent-blankline.nvim'
Plug 'hrsh7th/vim-vsnip'
Plug 'rafamadriz/friendly-snippets'

call plug#end()

set termguicolors
let g:onedark_transparent_background = 1
let g:onedark_disable_toggle_style = 1
let g:onedark_style='darker'
colorscheme onedark
" highlight Normal guibg=None
" highlight ColorColumn guibg=black
highlight Pmenu guibg=None
highlight CursorLine guibg=None
" highlight SignColumn guibg=None
" highlight LineNr guibg=None guifg=Gray

let g:rnvimr_enable_ex = 1 " Make Ranger replace Netrw and be the file explorer
let g:rnvimr_hide_gitignore = 1 " Hide the files included in gitignore
let g:rnvimr_enable_bw = 1 " Make Neovim wipe the buffers corresponding to the files deleted by Ranger
let g:auto_save = 1  " enable AutoSave on Vim startup
let g:auto_save_silent = 1  " do not display the auto-save notification

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
nnoremap <leader>t :RnvimrToggle<CR>
nnoremap <leader>g :Neogit<CR>
nnoremap <leader>ut :UndotreeToggle<CR>
nnoremap <leader>ff <cmd>Telescope find_files<cr>
nnoremap <leader>fg <cmd>Telescope live_grep<cr>
nnoremap <leader>fb <cmd>Telescope buffers<cr>
nnoremap <leader>fh <cmd>Telescope help_tags<cr>
" Use <Tab> and <S-Tab> to navigate through popup menu
inoremap <expr> <Tab>   pumvisible() ? "\<C-n>" : "\<Tab>"
inoremap <expr> <S-Tab> pumvisible() ? "\<C-p>" : "\<S-Tab>"

" Confirms snippet selection currently
inoremap <silent><expr> <CR> compe#confirm('<CR>')

augroup remove_whitespace
    autocmd!
    autocmd BufWritePre * %s/\s\+$//e
augroup END

lua <<EOF

-- Testing --
require("indent_blankline").setup {
    char = '│',
    buftype_exclude = {"terminal"},
    -- show_current_context = true,
}
require("colorizer").setup{}
-- End Testing --

require('nvim-autopairs').setup()
require'compe'.setup {
  enabled = true;
  autocomplete = true;
  debug = false;
  min_length = 1;
  preselect = 'enable';
  throttle_time = 80;
  source_timeout = 200;
  resolve_timeout = 800;
  incomplete_delay = 400;
  max_abbr_width = 100;
  max_kind_width = 100;
  max_menu_width = 100;
  documentation = {
    border = 'single',
    winhighlight = 'NormalFloat:CompeDocumentation,FloatBorder:CompeDocumentationBorder',
    max_width = 120,
    min_width = 60,
    max_height = math.floor(vim.o.lines * 0.3),
    min_height = 1,
  };
  source = {
    path = true;
    buffer = true;
    calc = true;
    nvim_lsp = true;
    nvim_lua = true;
    vsnip = true;
    emoji = true;
  };
}

require('lspkind').init({
    with_text = true,
    preset = 'default',
})

require'lsp_signature'.on_attach(
    {
      bind = true, -- This is mandatory, otherwise border config won't get registered.
                   -- If you want to hook lspsaga or other signature handler, pls set to false
      doc_lines = 10, -- will show two lines of comment/doc(if there are more than two lines in doc, will be truncated);
                     -- set to 0 if you DO NOT want any API comments be shown
                     -- This setting only take effect in insert mode, it does not affect signature help in normal
                     -- mode, 10 by default
      floating_window = true, -- show hint in a floating window, set to false for virtual text only mode
      fix_pos = false,  -- set to true, the floating window will not auto-close until finish all parameters
      hint_enable = false, -- virtual hint enable
      --hint_prefix = "🔎 ",  -- Panda for parameter
      hint_prefix = "",
      hint_scheme = "String",
      use_lspsaga = false,  -- set to true if you want to use lspsaga popup
      hi_parameter = "Search", -- how your parameter will be highlight
      max_height = 12, -- max height of signature floating_window, if content is more than max_height, you can scroll down
                       -- to view the hiding contents
      max_width = 120, -- max_width of signature floating_window, line will be wrapped if exceed max_width
      handler_opts = {
        border = "single"   -- double, single, shadow, none
      },
    }
)

require('lualine').setup {
  options = {
    theme = 'onedark',
    icons_enabled = true,
  }
}

require('gitsigns').setup()
require('which-key').setup{
    window =  {
        border = "single"
    }
}

require'nvim-treesitter.configs'.setup {
    ensure_installed = "all",
    highlight = {
        enable = true,
        additional_vim_regex_highlighting = false,
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
  buf_set_keymap('n', 'K', '<Cmd>lua vim.lsp.buf.hover()<CR>', opts)
  buf_set_keymap('n', 'gi', '<cmd>lua vim.lsp.buf.implementation()<CR>', opts)
  buf_set_keymap('n', '<space>s', '<cmd>lua vim.lsp.buf.signature_help()<CR>', opts)
--  buf_set_keymap('n', '<space>wa', '<cmd>lua vim.lsp.buf.add_workspace_folder()<CR>', opts)
--  buf_set_keymap('n', '<space>wr', '<cmd>lua vim.sp.buf.remove_workspace_folder()<CR>', opts)
--  buf_set_keymap('n', '<space>wl', '<cmd>lua print(vim.inspect(vim.lsp.buf.list_workspace_folders()))<CR>', opts)
  buf_set_keymap('n', '<C-k>', '<cmd>lua vim.lsp.buf.type_definition()<CR>', opts)
  buf_set_keymap('n', '<space>rn', '<cmd>lua vim.lsp.buf.rename()<CR>', opts)
--  buf_set_keymap('n', '<space>ca', '<cmd>lua vim.lsp.buf.code_action()<CR>', opts)
  buf_set_keymap('n', 'gr', '<cmd>lua vim.lsp.buf.references()<CR>', opts)
  buf_set_keymap('n', 'grp', '<cmd>cp<CR>', opts)
  buf_set_keymap('n', 'grn', '<cmd>cn<CR>', opts)
  buf_set_keymap('n', 'grc', '<cmd>ccl<CR>', opts)
  buf_set_keymap('n', '<space>s', '<cmd>lua vim.lsp.diagnostic.show_line_diagnostics({border="single"})<CR>', opts)
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
-- Add borders
vim.lsp.handlers["textDocument/hover"] =
  vim.lsp.with(
  vim.lsp.handlers.hover,
  {
    border = "single"
  }
)
vim.lsp.handlers["textDocument/signatureHelp"] =
  vim.lsp.with(
  vim.lsp.handlers.signature_help,
  {
    border = "single"
  }
)

-- Change diagnostic symbols in gutter
local signs = { Error = " ", Warning = " ", Hint = " ", Information = " " }
for type, icon in pairs(signs) do
  local hl = "LspDiagnosticsSign" .. type
  vim.fn.sign_define(hl, { text = icon, texthl = hl, numhl = "" })
end

-- Use a loop to conveniently call 'setup' on multiple servers and
-- map buffer local keybindings when the language server attaches
local servers = { "pyright", "rust_analyzer"}
for _, lsp in ipairs(servers) do
  nvim_lsp[lsp].setup { on_attach = on_attach }
end
-- LSP --

EOF
