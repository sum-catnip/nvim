-- module to easier create keybinds

-- global table to hold our functions
_bindfuncs = {}
-- current bindfunc index
local bindfunc_i = 0

return function(mode, lhs, rhs, ...)
  -- for every optional argument we make a field in the opts table
  -- the field will be set to true
  -- we do this because the neovim api wants {thing1: true, thing2: true, ...}
  local opt = {}
  local args = {}
  -- either use varargs or a table as the last arg
  if #({...}) == 1 and type(({...})[1]) == 'table' then args = ({...})[1]
  else args = ({...})
  end

  for _, a in ipairs(args) do opt[a] = true end

  -- if we pass in a lua function
  if type(rhs) == 'function' then
    -- make a vim readable expression that will call our function
    -- in the global _bindfuncs table
    bindfunc_i = bindfunc_i + 1
    local name = 'bindfunc_' .. tostring(bindfunc_i)
    _bindfuncs[name] = rhs
    -- if we use `cmd` the function return value is ignored
    if opt.cmd then
      rhs = '<cmd>call v:lua._bindfuncs.' .. name .. '()<cr>'
      -- remove cmd because its not actually valid as an option
      opt.cmd = nil
    else
      -- otherwise we call it as an expression using the return value
      rhs = 'v:lua._bindfuncs.' .. name .. '()'
      opt.expr = true
    end
  end

  -- buffer local bindings
  if args['buf'] then
    return vim.api.nvim_buf_set_keymap(({...})['buf'], mode, lhs, rhs, opt)
  else
    return vim.api.nvim_set_keymap(mode, lhs, rhs, opt)
  end
end
