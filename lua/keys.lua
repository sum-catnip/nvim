local key = vim.api.nvim_set_keymap

-- easy buffer switching


-- use jk for escape
key('i', 'jk', '<ESC>', {noremap = true})
