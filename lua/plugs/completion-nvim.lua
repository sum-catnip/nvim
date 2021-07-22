vf    = require('vfuncs')
codes = require('termcodes')
bind  = require('binds')

vim.o.completeopt = 'menuone,noinsert,noselect'
vim.o.shortmess = vim.o.shortmess .. 'c'

-- cant figure out how to call <Plug> commands from lua
vim.cmd('imap <tab> <Plug>(completion_smart_tab)')
vim.cmd('imap <s-tab> <Plug>(completion_smart_s_tab)')

vim.g.completion_matching_strategy_list = {'exact', 'substring', 'fuzzy'}
