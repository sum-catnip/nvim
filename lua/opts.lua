-- window --

-- show line numbers
vim.wo.number = true
-- put numbers and signs in the same column
vim.wo.signcolumn = 'number'

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
-- number of spaces a tab should be
vim.o.tabstop = 2
-- implicit tab size
vim.o.softtabstop = 2
-- another kind of stabstop
vim.o.shiftwidth = 2
-- convert tabs to spaces
vim.o.expandtab = true
vim.o.autoindent = true

-- coc compatability --

-- abandon buffer when unloading
vim.o.hidden = true
-- some language servers dont like backup files
vim.o.backup = false
vim.o.writebackup = false
-- more space for coc messages
vim.o.cmdheight = 2
-- more responsiveness
vim.o.updatetime = 300
-- avoid some prompts?
vim.o.shortmess = vim.o.shortmess .. 'c'

-- set leader key to space
vim.g.mapleader = ' '

-- set language to english
vim.cmd('language en_US.utf-8')
-- vim.v.lang = 'en_US'

-- enable syntax highlighting
vim.cmd('syntax on')

-- enable filetype detection
vim.cmd('filetype plugin indent on')
