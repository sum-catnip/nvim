bind = require('binds')

-- easy buffer switching (crlt+direction to switch buffer)
bind('n', '<C-J>', '<C-W><C-J>', 'noremap')
bind('n', '<C-K>', '<C-W><C-K>', 'noremap')
bind('n', '<C-L>', '<C-W><C-L>', 'noremap')
bind('n', '<C-H>', '<C-W><C-H>', 'noremap')

-- use jk for escape
bind('i', 'jk', '<ESC>', 'noremap')

-- coc trigger completion
-- bind('i', '<Tab>', 'v:lua.coc_trigger_tab_completion()', 'noremap', 'silent', 'expr')

-- coc advance completion or de-tab
-- bind('i', '<S-Tab>', 'v:lua.coc_shifttab_advance_completions()', 'noremap', 'expr')

-- bind('i', '<cr>', 'v:lua.coc_cr_confirm_completion')
