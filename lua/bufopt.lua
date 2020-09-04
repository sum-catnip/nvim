-- utility module for setting buffer options
-- from the neovim docs: `With ":set" both the local and global value is changed`
-- so we need to set the local buffer and global option

local mt  = {}

function mt.__newindex(_, k, v)
  vim.o[k]  = v
  vim.bo[k] = v
end

return setmetatable({}, mt)
