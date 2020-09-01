-- window --

-- show line numbers
vim.wo.number = true

-- edior --

-- set font in gui
if vim.o.guifont then
  vim.o.guifont = 'Iosevka:14'
end
  
-- split a new buffer to the right
vim.o.splitright = true
-- split new buffer to the bottom
vim.o.splitbelow = true
-- briefly jump to matching seperator
vim.o.showmatch = true
-- case insensitive search
vim.o.ignorecase = true
-- highlight searches
vim.o.hlsearch = true
-- copy-paste with system clipboard
vim.o.clipboard = 'unnamedplus'
-- background color for themes
vim.o.background = 'dark'

-- buffer --

-- number of spaces a tab should be
vim.bo.tabstop = 2
-- implicit tab size
vim.bo.softtabstop = 2
-- another kind of stabstop
vim.bo.shiftwidth = 2
-- convert tabs to spaces
vim.bo.expandtab = true
vim.bo.autoindent = true

-- set leader key to space
vim.g.mapleader = ' '

-- set language to english
vim.cmd('language en_US.utf-8')
-- vim.v.lang = 'en_US'

-- enable syntax highlighting
vim.cmd('syntax on')

-- enable filetype detection
vim.cmd('filetype plugin indent on')
