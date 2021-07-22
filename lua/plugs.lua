local packer = require('packer')
local vf = require('vfuncs')

vim.cmd [[packadd packer.nvim]]

packer.startup(function(use)
  use 'wbthomason/packer.nvim'
  use { 'nvim-treesitter/nvim-treesitter', run = ':TSUpdate' }
  use 'psliwka/vim-smoothie'
  use 'mhinz/vim-startify'
  use { 'junegunn/fzf', run = function() vf.fzf.install() end }
  use 'junegunn/fzf.vim'
  use 'machakann/vim-sandwich'
  use 'bluz71/vim-moonfly-colors'
  use 'kyazdani42/nvim-web-devicons'
  use 'justinmk/vim-sneak'
  use 'dag/vim-fish'
  use 'neovim/nvim-lspconfig'
  use 'nvim-lua/completion-nvim'
  use 'cespare/vim-toml'
  use 'gfanto/fzf-lsp.nvim'
  use 'itchyny/lightline.vim'
  use 'cohama/lexima.vim'
end)

require('plugs.startify')
require('plugs.fzf')
require('plugs.sneak')
require('plugs.lsp')
require('plugs.completion-nvim')
