local key = vim.api.nvim_set_keymap

-- easy buffer switching (crlt+direction to switch buffer)
key('n', '<C-J>', '<C-W><C-J>', {noremap = true})
key('n', '<C-K>', '<C-W><C-K>', {noremap = true})
key('n', '<C-L>', '<C-W><C-L>', {noremap = true})
key('n', '<C-H>', '<C-W><C-H>', {noremap = true})

-- use jk for escape
key('i', 'jk', '<ESC>', {noremap = true})
