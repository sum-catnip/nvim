vf    = require('vfuncs')
codes = require('termcodes')
bind  = require('binds')

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

-- scroll through diagnostics
-- bind('n', 'ge', function() return vf.CocAction('diagnosticPrevious') end, 'noremap')
-- bind('n', 'ge', function() return vf.CocAction('diagnosticNext') end, 'noremap')

-- scroll through diagnostics
-- bind('n', ']g', 'coc-diagnostic-next', 'silent')
