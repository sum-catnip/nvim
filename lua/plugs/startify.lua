bind = require('binds')

-- update session on exit
vim.g.startify_session_persistence = true

vim.g.startify_custom_header = {
  '   ╻ ╻   ╻   ┏┳┓',
  '   ┃┏┛   ┃   ┃┃┃',
  '   ┗┛    ╹   ╹ ╹'
}

-- show only recent files and sessions
vim.g.startify_lists = {
  { type = 'sessions', header = { '  Saved Sessions' }},
  { type = 'dir',      header = { '  Recent Files' }}
}

-- save session
bind('n', '<leader>ss', function() vim.cmd('SSave') end, 'noremap', 'cmd')
-- lise sessions
bind('n', '<leader>ls', function() vim.cmd('SClose') end, 'noremap', 'cmd')
