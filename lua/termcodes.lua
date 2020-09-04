local termcodes = {}

local function insert_code(code)
  local res = vim.api.nvim_replace_termcodes(code, true, true, true)
  termcodes[code] = res
  return res
end

function termcodes.parse(code)
  -- check if code is not already in cache
  return termcodes[code] or insert_code(code)
end

return termcodes
