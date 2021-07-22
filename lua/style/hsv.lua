local mt = {}
local proto = {}

local function hsv(h, s, v)
  return setmetatable({ h = h, s = s, v = v}, mt)
end

local function cpy(t) return hsv(t.h, t.s, t.v) end

function bounds(i)
  return math.max(math.min(i, 1.0), 0.0)
end

function proto.off_h(t, o)
  local t = cpy(t)
  t.h = bounds(t.h + (o / 100))
  return t
end

function proto.off_s(t, o)
  local t = cpy(t)
  t.s = bounds(t.s + (o / 100))
  return t
end

function proto.off_v(t, o)
  local t = cpy(t)
  t.v = bounds(t.v + (o / 100))
  return t
end

--[[
 * i stole this from:
 * https://github.com/EmmanuelOga/columns/blob/master/utils/color.lua
 * Converts an HSV color value to RGB. Conversion formula
 * adapted from http://en.wikipedia.org/wiki/HSV_color_space.
 * Assumes h, s, and v are contained in the set [0, 1] and
 * returns r, g, and b in the set [0, 255].
 *
 * @param   Number  h       The hue
 * @param   Number  s       The saturation
 * @param   Number  v       The value
 * @return  String          The hex representation
]]
function mt.__tostring(t)
  local h, s, v = t.h, t.s, t.v
  local r, g, b

  local i = math.floor(h * 6);
  local f = h * 6 - i;
  local p = v * (1 - s);
  local q = v * (1 - f * s);
  local t = v * (1 - (1 - f) * s);

  i = i % 6

  if i == 0 then r, g, b = v, t, p
  elseif i == 1 then r, g, b = q, v, p
  elseif i == 2 then r, g, b = p, v, t
  elseif i == 3 then r, g, b = p, q, v
  elseif i == 4 then r, g, b = t, p, v
  elseif i == 5 then r, g, b = v, p, q
  end

  function x(num)
    return string.format('%02X', num * 255)
  end

  return '#' .. x(r) .. x(g) .. x(b)
end

function mt.__concat(x, y)
  return tostring(x) .. tostring(y)
end

mt.__index = proto

return hsv
