local mt  = {}
local mt2 = {}

function mt.__index(_, k)
  return setmetatable({__func = k}, mt2)
end

function mt2.__index(t, k)
  t.__func = t.__func .. '#' .. k
  return t
end

function mt2.__call(t, ...)
  local res = vim.fn[t.__func](...)
  return res
end

return setmetatable({}, mt)
