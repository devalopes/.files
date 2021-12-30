--------------------------------------------------------------------------------
-- Neovim settings
--------------------------------------------------------------------------------
local opt = vim.opt

opt.number = true              -- Set line numbers
opt.relativenumber = false     -- Set relative line numbering
opt.cursorline = true          -- Set cursor line
opt.tabstop = 4                -- Number of spaces a tab is rendered as
opt.softtabstop = 4            -- Number of spaces the cursor moves when pressing <Tab>
opt.shiftwidth = 4             -- Number of literal spaces for tab indentation
opt.numberwidth = 2            -- Size of number column 
opt.expandtab = true           -- Spaces instead of tabs
opt.smartindent = true         -- Insert indents automatically
opt.ignorecase = true          -- Ignore case in `/` searches
opt.smartcase = true           -- Capitals enforces case, otherwise ignore case
opt.hlsearch = false           -- Remove search highlight after <Enter>
opt.showmode = false           -- Hide status line -- INSERT --, -- VISUAL --, -- NORMAL --
opt.wrap = false               -- Disable line wrapping
opt.swapfile = false           -- Disable swap files
opt.hidden = true              -- Hide current buffer if unsaved work
opt.undofile = true            -- Set undofile (undodir created automatically)
opt.scrolloff = 10             -- Padding for scrolling vertically
opt.sidescrolloff = 5          -- Padding for scrolling horizontally
opt.colorcolumn = '80'         -- Add color column at 80 chars out
opt.signcolumn = 'yes'         -- Add a column to left of numbers for signs
opt.mouse = 'a'                -- Enable mouse mode 
opt.completeopt = {            -- Completion settings
    'menuone', 
    'noinsert', 
    'noselect'
}
opt.showcmd = false            -- Show last command
opt.ruler = false              -- Don't show cursor position in status line
opt.clipboard = 'unnamedplus'  -- Use system clipboard
opt.shellcmdflag = '-ic'       -- Source bashrc, make shell interactive
opt.splitbelow = true          -- Horizontal splits below instead of above 
opt.splitright = true          -- Vertical splits right instead of left
opt.wildignore = {             -- Ignore file patterns in menu
        '*.pyc',
        '*/__pycache__/',
        '**/node_modules/*',
        '**/.git/*',
}
opt.termguicolors = true       -- Enable true color support
opt.title = true               -- Set window title
opt.joinspaces = false         -- Joining does not add extra space chars


-- Remove color column marker for selected filetypes
cmd [[autocmd FileType text,markdown,html,xhtml,javascript,json setlocal cc=0]]

-- 2 spaces for selected filetypes
cmd [[
  autocmd FileType xml,html,xhtml,css,scss,javascript,lua,yaml,json setlocal shiftwidth=2 tabstop=2 softtabstop=2
]]


