-- util function to define autocmds

-- global table to hold our functions
_autofuncs = {}
-- current bindfunc index
local autofunc_i = 0

return function(event, pattern, action)
  -- if we pass in a lua function
  if type(action) == 'function' then
    -- make a vim readable expression that will call our function
    -- in the global _autofuncs table
    autofunc_i = autofunc_i + 1
    local name = 'autofunc_' .. tostring(autofunc_i)
    _autofuncs[name] = action
    action = 'call v:lua._autofuncs.' .. name .. '()'
  end

  -- space seperated string with all those componments
  return vim.cmd(table.concat({'autocmd', event, pattern, action}, ' '))
end
