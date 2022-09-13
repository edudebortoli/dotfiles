local status, packer = pcall(require, "packer")
if (not status) then
  print("Packer is not installed")
  return
end

vim.cmd [[packadd packer.nvim]]

packer.startup(function(use)
  use 'wbthomason/packer.nvim'
  -- Theme
--  use {
--    'svrana/neosolarized.nvim',
--    requires = { 'tjdevries/colorbuddy.nvim' }
--  }
  use 'folke/tokyonight.nvim'


  --Vim Status line
  use 'kyazdani42/nvim-web-devicons' -- File Icons
  use 'L3MON4D3/luaSnip' -- Snippet
  use 'hoob3rt/lualine.nvim' -- Vim StatusLine
  use 'onsails/lspkind-nvim' -- vscode-like pictograms
  use 'hrsh7th/cmp-buffer' -- nvim-cmp source for buffer words
  use 'hrsh7th/cmp-nvim-lsp' -- nvim-cmp source for neovim's built-in LSP
  use 'hrsh7th/nvim-cmp' -- Completion

  use 'williamboman/mason.nvim'
  use 'williamboman/mason-lspconfig.nvim'
  use 'neovim/nvim-lspconfig' -- LSP
  use 'glepnir/lspsaga.nvim'
  use {
    'nvim-treesitter/nvim-treesitter',
    run = ':TSUpdate'
  }

  use 'jose-elias-alvarez/null-ls.nvim' -- Use Neovim as a language server to inject LSP diagnostics, code actions, and more via Lua
  use 'MunifTanjim/prettier.nvim'
    use 'windwp/nvim-autopairs'
  use 'windwp/nvim-ts-autotag'

  use 'nvim-lua/plenary.nvim' -- Common utilities
  use 'nvim-telescope/telescope.nvim'
  use 'nvim-telescope/telescope-file-browser.nvim'

  use 'akinsho/nvim-bufferline.lua'
  use 'norcalli/nvim-colorizer.lua'

  use 'lewis6991/gitsigns.nvim'
  use 'dinhhuy258/git.nvim'
  use 'folke/zen-mode.nvim'
  use ({
    "iamcco/markdown-preview.nvim",
    run = function() vim.fn["mkdp#util#install"]() end,
  })


end)

