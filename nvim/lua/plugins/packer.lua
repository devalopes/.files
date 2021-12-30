local fn = vim.fn
local install_path = fn.stdpath('data')..'/site/pack/packer/start/packer.nvim'
if fn.empty(fn.glob(install_path)) > 0 then
  packer_bootstrap = fn.system({'git', 'clone', '--depth', '1', 'https://github.com/wbthomason/packer.nvim', install_path})
end

return require('packer').startup(function(use)
    use 'wbthomason/packer.nvim' -- Packer can manage itself

  if packer_bootstrap then
      -- Automatically set up your configuration after cloning packer.nvim
      -- Put this at the end after all plugins
    require('packer').sync()
  end
end)

vim.cmd([[ -- Changes to this file (`packer.lua`) run :PackerCompile
  augroup packer_user_config
    autocmd!
    autocmd BufWritePost packer.lua source <afile> | PackerCompile
  augroup end
]])
