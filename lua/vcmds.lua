local mt = {}

function mt.__index(t, k)
  mt.cmd = k
  return t
end

function mt.__call(_, ...)
  -- TODO: contatinate ... to arguments
  -- https://neovim.io/doc/user/lua.html
  -- vim.cmd({cmd})
  local res = vim.cmd(mt.cmd)
  mt.cmd = nil
  return res
end

return setmetatable({}, mt)
