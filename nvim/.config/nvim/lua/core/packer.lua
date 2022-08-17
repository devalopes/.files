-- Install packer if not in path
local fn = vim.fn
local install_path = fn.stdpath('data') .. '/site/pack/packer/start/packer.nvim'
if fn.empty(fn.glob(install_path)) > 0 then
  packer_bootstrap = fn.system({ 'git', 'clone', '--depth', '1', 'https://github.com/wbthomason/packer.nvim',
    install_path })
  vim.cmd [[packadd packer.nvim]]
end

return require('packer').startup(function(use)
  -- Packer itself
  use 'wbthomason/packer.nvim'

  -- Colorschemes & status line
  use 'Shatur/neovim-ayu'
  use {
    'nvim-lualine/lualine.nvim',
    requires = { 'kyazdani42/nvim-web-devicons', opt = true }
  }
  use 'norcalli/nvim-colorizer.lua'

  -- Navigation
  use {
    'kyazdani42/nvim-tree.lua',
    requires = { 'kyazdani42/nvim-web-devicons', opt = true }
  }
  use { 'glepnir/dashboard-nvim' }
  use {
    'nvim-telescope/telescope.nvim', tag = '0.1.0',
    requires = { 'nvim-lua/plenary.nvim' }
  }
  use { 'ahmedkhalf/project.nvim' }
  use { 'ggandor/leap.nvim' }

  -- Git integration
  use { 'TimUntersberger/neogit', requires = 'nvim-lua/plenary.nvim' }
  use { 'lewis6991/gitsigns.nvim' }

  -- Programming
  use { 'nvim-treesitter/nvim-treesitter', run = ':TSUpdate' }
  use { 'numToStr/Comment.nvim' }
  use { 'windwp/nvim-autopairs' }
  use { 'lukas-reineke/indent-blankline.nvim' }
  use {
    "williamboman/mason.nvim",
    "williamboman/mason-lspconfig.nvim",
    "neovim/nvim-lspconfig",
  }
  use { 'ray-x/lsp_signature.nvim' }
  use { 'simrat39/rust-tools.nvim' }
  use { 'weilbith/nvim-code-action-menu' }

  -- Auto completion
  use { 'hrsh7th/cmp-nvim-lsp' } -- LSP source
  use { 'hrsh7th/cmp-buffer' } -- Buffer words source
  use { 'hrsh7th/cmp-path' } -- Path source
  use { 'hrsh7th/cmp-cmdline' } -- Vim command line source
  use { 'hrsh7th/cmp-calc' } -- Calculator source
  use { 'hrsh7th/nvim-cmp' } -- General autocompletion engine
  use { 'onsails/lspkind.nvim' } -- Symbols for autocomplete
  -- Auto completion (snippets)
  use { 'L3MON4D3/LuaSnip' } -- Snippet engine
  use { 'saadparwaiz1/cmp_luasnip' } -- Snippet source for cmp
  use { 'rafamadriz/friendly-snippets' } -- Common snippets themselves

  -- General purpose
  use { 'folke/which-key.nvim' }
  use { 'j-hui/fidget.nvim' }
  use { 'alvarosevilla95/luatab.nvim', requires = 'kyazdani42/nvim-web-devicons' }


  -- Automaticallyset up configuration after cloning packer.nvim
  -- Keep this at the end after all plugins
  if packer_bootstrap then
    require('packer').sync()
  end
end)
