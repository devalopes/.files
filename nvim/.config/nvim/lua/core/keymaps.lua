local map = vim.api.nvim_set_keymap
local default_opts = { noremap = true, silent = true }

vim.g.mapleader = ' '

-- Movement
map('n', '<leader>w', '<Esc>:w<CR>', default_opts)
map('n', '<leader>wq', '<Esc>:wq<CR>', default_opts)
map('n', '<leader>q', '<Esc>:q<CR>', default_opts)
map('n', '<leader>Q', '<Esc>:q!<CR>', default_opts)

-- Terminal
map('n', '<r-t>', ':split |:resize 10| terminal<CR>', default_opts)
map('t', '<C-w>t', [[<C-\><C-n>]], default_opts)
map('n', '<leader>rr', '@:', default_opts)

-- NvimTree
map('n', '<leader>t', ':NvimTreeToggle<CR>', default_opts)
