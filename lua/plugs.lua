vf = require('vfuncs')
vf.plug.begin(vf.stdpath('data') .. '/plugged')

-- fish shell integration
vim.cmd("Plug 'dag/vim-fish'")
-- vscode plugins in vim
vim.cmd("Plug 'neoclide/coc.nvim', {'branch': 'release'}")
-- semantic highlighting
vim.cmd("Plug 'nvim-treesitter/nvim-treesitter'")
-- smooth scrolling
vim.cmd("Plug 'psliwka/vim-smoothie'") 
-- statusline
vim.cmd("Plug 'vim-airline/vim-airline'")
-- theme
vim.cmd("Plug 'challenger-deep-theme/vim', { 'as': 'challenger-deep' }")
-- start menu
vim.cmd("Plug 'mhinz/vim-startify'")
-- fzf
vim.cmd("Plug 'junegunn/fzf', { 'do': { -> fzf#install() } }")
vim.cmd("Plug 'junegunn/fzf.vim'")
-- coc-fzf
vim.cmd("Plug 'antoinemadec/coc-fzf'")

vf.plug['end']()

-- import plugs settings
require('plugs.coc')
require('plugs.treesitter')
require('plugs.startify')
