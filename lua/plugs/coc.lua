vf    = require('vfuncs')
codes = require('termcodes')
bind  = require('binds')
af    = require('autofunc')

-- util function to convert an int to a bool
local function b(i) return i ~= 0 end

-- checks for preceding whitespace
-- true = preceding whitespace
-- false = no preceding whitespace
local function preceding_whitespace()
  local col = vf.col('.') -1
  -- col 0 is always preceding whitespace
  -- otherwise we just check for whitespace with pattern matching
  return (not b(col)) or vf.getline('.'):sub(col, col):match('%s')
end

-- trigger completion
bind('i', '<Tab>', function()
  -- if a completion popup is open
  if b(vf.pumvisible()) then
    -- go to the next completion item
    return codes.parse('<C-n>')
  elseif preceding_whitespace() then
      return codes.parse('<TAB>')
      else return vf.coc.refresh()
  end
end, 'noremap', 'silent')

-- advance completion or de-tab
bind('i', '<S-Tab>', function()
  return b(vf.pumvisible()) and codes.parse('<C-p>') or codes.parse('<C-d>')
end, 'noremap')

if vf.complete_info then
  bind('i', '<cr>', function()
    return vf.complete_info().selected ~= -1
      and codes.parse('<C-y>')
      or  codes.parse('<C-g>u<CR>')
  end, 'noremap')
else
  bind('i', '<cr>', function()
    return b(vf.pumvisible())
      and codes.parse('<C-y>')
      or  codes.parse('<C-g>u<CR>')
  end, 'noremap')
end

-- we use cmd so the return value is ignored
bind('n', 'ge]', function() vf.CocActionAsync('diagnosticNext') end, 'silent', 'cmd')
bind('n', 'ge[', function() vf.CocActionAsync('diagnosticPrevious') end, 'silent', 'cmd')

-- gotos
bind('n', 'gd', function() vf.CocActionAsync('jumpDefinition') end, 'silent', 'cmd')
bind('n', 'gy', function() vf.CocActionAsync('jumpTypeDefinition') end, 'silent', 'cmd')
bind('n', 'gi', function() vf.CocActionAsync('jumpImplementation') end, 'silent', 'cmd')
bind('n', 'gr', function() vf.CocActionAsync('jumpReferences') end, 'silent', 'cmd')

-- show docs
bind('n', 'K', function()
  local ft = vim.bo.filetype
  if ft:find('vim') or ft:find('help') then
    vim.cmd("execute 'h '.expand('<cword>')")
  else vf.CocActionAsync('doHover')
  end
end, 'silent', 'cmd')

-- highlight symbol under cursor (and references)
af('CursorHold', '*', function() vf.CocActionAsync('highlight') end)

-- rename symbol under cursor
bind('n', '<leader>rn', function() vf.CocActionAsync('rename') end, 'cmd')

-- so i have no idea how to go about doing this in actual lua
-- what this does is:
-- if: will select inside function for v and o mode
--  (ex: cif will delete the first line of the function and go into insert mode)
-- af: will select at function for v and o mode
--  (ex: caf will delete the function and go into insert mode)
-- ic, ac same as if and af but for classes
bind('x', 'if', '<Plug>(coc-funcobj-i)')
bind('o', 'if', '<Plug>(coc-funcobj-i)')

bind('x', 'if', '<Plug>(coc-funcobj-a)')
bind('o', 'if', '<Plug>(coc-funcobj-a)')

bind('x', 'ic', '<Plug>(coc-classobj-i)')
bind('o', 'ic', '<Plug>(coc-classobj-i)')

bind('x', 'ac', '<Plug>(coc-classobj-a)')
bind('o', 'ac', '<Plug>(coc-classobj-a)')

-- listings

-- diagnostics
bind('n', '<leader>ld', function() vim.cmd('CocFzfList diagnostics') end, 'silent', 'nowait', 'cmd')
-- extensions
bind('n', '<leader>le', function() vim.cmd('CocFzfList extensions') end, 'silent', 'nowait', 'cmd')
-- commands
bind('n', '<leader>lc', function() vim.cmd('CocFzfList commands') end, 'silent', 'nowait', 'cmd')
-- local symbol
bind('n', '<leader>lls', function() vim.cmd('CocFzfList outline') end, 'silent', 'nowait', 'cmd')
-- workspace symbol
bind('n', '<leader>ls', function() vim.cmd('CocFzfList -I symbols') end, 'silent', 'nowait', 'cmd')
-- yanks
bind('n', '<leader>ly', function() vim.cmd('CocFzfList -A --normal yank') end, 'silent', 'nowait', 'cmd')
-- actions
bind('n', '<leader>la', function() vim.cmd('CocFzfList actions') end, 'silent', 'nowait', 'cmd')

-- autoinstall extensions
vim.g.coc_global_extensions = {
  'coc-python',
  'coc-json',
  'coc-highlight',
  'coc-yank',
  'coc-cord',
  'coc-rust-analyzer'
}
