local mt = {}

function mt.__index(t, k)
  if not mt.funcname then mt.funcname = k
  else mt.funcname = mt.funcname .. '#' .. k end
  return t
end

function mt.__call(_, ...)
  local res = vim.fn[mt.funcname](...)
  mt.funcname = nil
  return res
end

return setmetatable({}, mt)
