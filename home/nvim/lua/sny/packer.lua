-- This file can be loaded by calling `lua require('plugins')` from your init.vim

-- Only required if you have packer configured as `opt`
vim.cmd [[packadd packer.nvim]]

return require('packer').startup(function(use)
  -- Packer can manage itself
  use 'wbthomason/packer.nvim'

  -- Telescope
  use {
    'nvim-telescope/telescope.nvim',
    requires = { { 'nvim-lua/plenary.nvim' } }
  }

  use 'simeji/winresizer'
  use {
    'nvim-lualine/lualine.nvim',
    requires = { 'nvim-tree/nvim-web-devicons', opt = true },
  }

  -- Colorschemes
  use { "catppuccin/nvim", as = "catppuccin" }
  use "vv9k/bogster"

  -- Treesitter
  use('nvim-treesitter/nvim-treesitter', { run = ':TSUpdate' })
  use 'nvim-treesitter/playground'

  use 'mbbill/undotree'
  use 'tpope/vim-fugitive'

  use 'm4xshen/autoclose.nvim'

  -- nushell
  use 'jose-elias-alvarez/null-ls.nvim'
  use 'LhKipp/nvim-nu'

  use {
    'VonHeikemen/lsp-zero.nvim',
    -- branch = 'v3.x',
    requires = {
      -- LSP Support
      { 'neovim/nvim-lspconfig' },
      -- Autocompletion
      { 'hrsh7th/nvim-cmp' },
      { 'hrsh7th/cmp-nvim-lsp' },
      { 'hrsh7th/cmp-nvim-lua' },
      { 'L3MON4D3/LuaSnip' },
    }
  }

  -- Normal commenting
  use {
    'numToStr/Comment.nvim',
    config = function()
      require('Comment').setup()
    end
  }

  -- That multicursor
  use 'mg979/vim-visual-multi'
end)
