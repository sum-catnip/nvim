-- module to easier create keybinds

-- global table to hold our functions
_bindfuncs = {}
-- current bindfunc index
local bindfunc_i = 0

return function(mode, lhs, rhs, ...)
  local opt = {}
  for _, a in ipairs({...}) do opt[a] = true end

  if type(rhs) == 'function' then
    bindfunc_i = bindfunc_i + 1
    local name = 'bindfunc_' .. tostring(bindfunc_i)
    _bindfuncs[name] = rhs
    rhs = 'v:lua._bindfuncs.' .. name .. '()'
    opt.expr = true
  end

  return vim.api.nvim_set_keymap(mode, lhs, rhs, opt)
end
