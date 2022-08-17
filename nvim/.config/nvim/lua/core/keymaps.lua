local map = vim.api.nvim_set_keymap
local default_opts = { noremap = true, silent = true }

vim.g.mapleader = ' '

-- Macros
map('n', 'q:', '<nop>', default_opts)
map('n', 'm', 'q', default_opts)
map('n', 'q', '<nop>', default_opts)

-- Movement
map('n', '<C-q>', '<Cmd>exit<CR>', default_opts)
map('n', '<C-w>w', '<Esc>:update<CR>', default_opts)
map('n', '<C-w>q', '<Cmd>exit<CR>', default_opts)
map('n', '<C-w>Q', '<Esc>:q!<CR>', default_opts)
map('n', '<C-w>x', '<Cmd>exit<CR>', default_opts)

-- Terminal
map('n', '<C-t>', ':10split|terminal<CR>', default_opts)
map('t', '<C-t>', [[<C-\><C-n>:vsplit|terminal<CR>]], default_opts)
map('t', '<C-w>t', [[<C-\><C-n>]], default_opts)
map('t', '<C-w>n', [[<C-\><C-n>]], default_opts)
map('t', '<C-q>', '<Cmd>exit<CR>', default_opts)
map('t', '<C-w>x', '<Cmd>exit<CR>', default_opts)
map('n', '<leader>rr', '@:', default_opts)

-- NvimTree
map('n', '<leader>t', ':NvimTreeToggle<CR>', default_opts)

-- Git
map('n', '<leader>g', ':Neogit<CR>', default_opts)

-- Telescope
map('n', '<leader>ff', ':Telescope find_files<CR>', default_opts)
map('n', '<leader>fd', ':Telescope find_files hidden=true<CR>', default_opts)
map('n', '<leader>fh', ':Telescope help_tags<CR>', default_opts)
map('n', '<leader>fg', ':Telescope live_grep<CR>', default_opts)
map('n', '<leader>fb', ':Telescope buffers<CR>', default_opts)
map('n', '<leader>fp', ':Telescope projects<CR>', default_opts)
map('n', '<leader>fo', ':Telescope oldfiles<CR>', default_opts)

-- Mason
map('n', '<leader>m', ':Mason<CR>', default_opts)

-- Code Actions
map('n', '<C-a>', ':CodeActionMenu<CR>', default_opts)

-- Quick Fix (<C-q> Telescope send to quickfix)
map('n', '<C-o>', ':copen<CR>', default_opts)
map('n', '<C-c>', ':cclose | lclose<CR>', default_opts) -- Close quick fix *or* loc list
map('n', '<C-n>', ':cnext<CR>', default_opts)
map('n', '<C-p>', ':cprevious<CR>', default_opts)

-- Dashboard
map('n', '<leader>fn', ':DashboardNewFile<CR>', default_opts)
-- map('n', '<leader>ss', ':SessionSave<CR>', default_opts)
-- map('n', '<leader>sl', ':SessionLoad<CR>', default_opts)
