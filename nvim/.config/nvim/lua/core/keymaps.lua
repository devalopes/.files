local map = vim.api.nvim_set_keymap
local default_opts = { noremap = true, silent = true }

vim.g.mapleader = ' '

-- Macros
map('n', 'q:', '<nop>', default_opts)
map('n', 'm', 'q', default_opts)
map('n', 'q', '<nop>', default_opts)

-- Movement
map('n', '<leader>w', '<Esc>:update<CR>', default_opts)
map('n', '<leader>wq', '<Esc>:update | q<CR>', default_opts)
map('n', '<leader>q', '<Esc>:q<CR>', default_opts)
map('n', '<leader>Q', '<Esc>:q!<CR>', default_opts)

-- Terminal
map('n', '<C-t>', ':split |:resize 10| terminal<CR>', default_opts)
map('t', '<C-w>t', [[<C-\><C-n>]], default_opts)
map('n', '<leader>rr', '@:', default_opts)

-- NvimTree
map('n', '<leader>t', ':NvimTreeToggle<CR>', default_opts)

-- Git
map('n', '<leader>g', ':Neogit<CR>', default_opts)

-- Telescope
map('n', '<leader>ff', ':Telescope find_files<CR>', default_opts)
map('n', '<leader>fh', ':Telescope find_files hidden=true<CR>', default_opts)
map('n', '<leader>f?', ':Telescope help_tags<CR>', default_opts)
map('n', '<leader>fg', ':Telescope live_grep<CR>', default_opts)
map('n', '<leader>fb', ':Telescope buffers<CR>', default_opts)
map('n', '<leader>fp', ':Telescope projects<CR>', default_opts)
map('n', '<leader>fo', ':Telescope oldfiles<CR>', default_opts)

-- Mason
map('n', '<leader>fm', ':Mason<CR>', default_opts)

-- Code Actions
map('n', '<leader>fx', ':CodeActionMenu<CR>', default_opts)

-- Dashboard
map('n', '<leader>fn', ':DashboardNewFile<CR>', default_opts)
map('n', '<leader>ss', ':SessionSave<CR>', default_opts)
map('n', '<leader>sl', ':SessionLoad<CR>', default_opts)

