local mt = {}
function mt.__newindex(t, k, v)
  local gui = v.gui and 'gui='..v.gui or 'gui=NONE'
  local sp = v.sp and 'guisp='..v.sp or 'guisp=NONE'
  local fg = v.fg and 'guifg='..v.fg or 'guifg=NONE'
  local bg = v.bg and 'guibg='..v.bg or 'guibg=NONE'
  vim.cmd('highlight '..k..' '..gui..' '..sp..' '..fg..' '..bg)
end

return setmetatable({}, mt)
