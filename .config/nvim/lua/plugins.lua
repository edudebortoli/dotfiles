local status, packer = pcall(require, "packer")
if (not status) then
  print("Packer is not installed")
  return
end

vim.cmd [[packadd packer.nvim]]

packer.startup(function(use)
  use 'wbthomason/packer.nvim'
  -- Theme
  use {
    'svrana/neosolarized.nvim',
    requires = { 'tjdevries/colorbuddy.nvim' }
  }
  --Vim Status line
  use 'hoob3rt/lualine.nvim' -- Vim StatusLine
  use 'neovim/nvim-lspconfig' -- LSP
end)

