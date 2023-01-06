local packer = require('packer')

vim.cmd [[packadd packer.nvim]]

packer.startup(function(use)
  use 'wbthomason/packer.nvim' -- lua plugin manager
  use { 'nvim-treesitter/nvim-treesitter', run = ':TSUpdate' } -- syntax highlight
  use 'psliwka/vim-smoothie' -- smooth scrolling
  use 'mhinz/vim-startify' -- start menu
  -- use 'machakann/vim-sandwich' -- surround selection with character
  use({ -- surround selection with character
    'kylechui/nvim-surround',
    tag = "*", -- Use for stability; omit to use `main` branch for the latest features
  })
  use { -- highlight function args/params
    'm-demare/hlargs.nvim',
    requires = { 'nvim-treesitter/nvim-treesitter' }
  }
  use 'NvChad/nvim-colorizer.lua' -- colors hex and color names
  use 'bluz71/vim-moonfly-colors' -- color theme
  use 'kyazdani42/nvim-web-devicons'
  -- use 'justinmk/vim-sneak' -- s + 2 chars as a motion
  use 'dag/vim-fish' -- fish shell syntax
  use 'neovim/nvim-lspconfig'
  use 'cespare/vim-toml' -- toml syntax
  use 'itchyny/lightline.vim' -- statusbar
  -- use 'cohama/lexima.vim' -- auto close parenthesis
  use 'm4xshen/autoclose.nvim'

  -- autocomplete
  use 'neovim/nvim-lspconfig'
  use 'hrsh7th/cmp-nvim-lsp'
  use 'hrsh7th/cmp-buffer'
  use 'hrsh7th/cmp-path'
  use 'hrsh7th/cmp-cmdline'
  use 'hrsh7th/nvim-cmp'

  -- code snippets
  use({"L3MON4D3/LuaSnip", tag = "v<CurrentMajor>.*"})
end)

require('plugs.startify')
--require('plugs.fzf')
require('plugs.sneak')
require('plugs.lsp')
require('plugs.nvim-cmp')
--require('plugs.completion-nvim')
