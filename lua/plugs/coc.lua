vfuncs = require('vfuncs')
codes  = require('termcodes')

-- util function to convert an int to a bool
local function b(i) return i ~= 0 end

local function check_back_space()
  local col = vfuncs.col('.') -1
  -- TODO:
  -- this is not how to index strings in lua
  -- ill need a unicode safe and nvim compatible way of getting a char
  -- or a column
  -- wait maybe theres already an api to get the last char
  print((vfuncs.getline('.'))[1])
  return true
  -- return col == 0 or (vfuncs.getline('.')[col]):match('%s')
end

function coc_trigger_completion()
  -- if a completion popup is open
  if b(vfuncs.pumvisible()) then
    -- go to the next completion item
    return codes.parse('<C-n>')
  elseif b(check_back_space()) then
      return codes.parse('<TAB>')
      else vfuncs.coc.refresh()
  end
end
