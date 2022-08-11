-- Install packer if not in path
local fn = vim.fn
local install_path = fn.stdpath('data')..'/site/pack/packer/start/packer.nvim'
if fn.empty(fn.glob(install_path)) > 0 then
  packer_bootstrap = fn.system({'git', 'clone', '--depth', '1', 'https://github.com/wbthomason/packer.nvim', install_path})
  vim.cmd [[packadd packer.nvim]]
end

-- Changes to this file should re-run :PackerCompile
vim.cmd([[  
      augroup packer_user_config
      autocmd!
      autocmd BufWritePost packer.lua source <afile> | PackerCompile
    augroup end
  ]])

return require('packer').startup(function(use)
      use 'wbthomason/packer.nvim' -- Packer can manage itself
      use 'shaunsingh/nord.nvim'
      use { 'nvim-treesitter/nvim-treesitter', run = ':TSUpdate' }
  
      -- Automaticallyset up configuration after cloning packer.nvim
      -- Keep this at the end after all plugins
    if packer_bootstrap then
      require('packer').sync()
    end
  end)
