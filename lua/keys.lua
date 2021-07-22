bind = require('binds')

-- easy buffer switching (crlt+direction to switch buffer)
bind('n', '<C-J>', '<C-W><C-J>', 'noremap')
bind('n', '<C-K>', '<C-W><C-K>', 'noremap')
bind('n', '<C-L>', '<C-W><C-L>', 'noremap')
bind('n', '<C-H>', '<C-W><C-H>', 'noremap')

-- use jk for escape
bind('i', 'jk', '<ESC>', 'noremap')
-- <ESC> for escaping terminal mode
bind('t', '<ESC>', '<C-\\><C-n>', 'noremap')
-- to actually insert the escape key
bind('t', '<C-v><Esc>', '<Esc>', 'noremap')

-- <leader>w for update
bind('n', '<leader>w', function() vim.cmd('update') end, 'cmd')
