local packer = require('packer')
local vf = require('vfuncs')

vim.cmd [[packadd packer.nvim]]

packer.startup(function(use)
  use 'wbthomason/packer.nvim' -- lua plugin manager
  use { 'nvim-treesitter/nvim-treesitter', run = ':TSUpdate' } -- syntax highlight
  use 'psliwka/vim-smoothie' -- smooth scrolling
  use 'mhinz/vim-startify' -- start menu
  use 'machakann/vim-sandwich' -- surround selection with character
  use 'bluz71/vim-moonfly-colors' -- color theme
  use 'kyazdani42/nvim-web-devicons'
  use 'justinmk/vim-sneak' -- s + 2 chars as a motion
  use 'dag/vim-fish' -- fish shell syntax
  use 'neovim/nvim-lspconfig'
  use 'cespare/vim-toml' -- toml syntax
  use 'itchyny/lightline.vim' -- statusbar
  use 'cohama/lexima.vim' -- auto close parenthesis
end)

require('plugs.startify')
--require('plugs.fzf')
require('plugs.sneak')
--require('plugs.lsp')
--require('plugs.completion-nvim')
