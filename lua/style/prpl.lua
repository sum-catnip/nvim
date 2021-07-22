local hi = require('hi')
local hsv = require('hsv')

local black  = hsv(0.6852, 0.9000, 0.0392)
local white  = hsv(0.0417, 0.0200, 0.7843)
local purple = hsv(0.7134, 0.9235, 0.6667)
local ocean  = hsv(0.6749, 0.5941, 0.6667)
local green  = hsv(0.4686, 0.3081, 0.6745)
local red    = hsv(0.9837, 0.8131, 0.8392)
local cyan   = hsv(0.4316, 0.6784, 1.0000)
local yellow = hsv(0.2016, 0.7197, 0.9373)
local pink   = hsv(0.9207, 0.5918, 0.9608)

local bg  = black
local txt = white

hi.Normal = { fg = txt, bg = bg }
-- hi.CursorLine = { bg = black:off_v(5) }
hi.LineNr = { fg = purple:off_v(10), bg = black:off_v(5) }
hi.CursorLineNr = { fg = pink, bg = black:off_v(5) }

-- code memes
hi.Comment = { fg = pink:off_s(25) }
hi.String = { fg = pink:off_s(-10) }
hi.Character = { fg = pink:off_s(-20) }

hi.Constant = { fg = green }
hi.Number = { fg = green:off_v(10) }
hi.Float = { fg = green:off_v(15) }
hi.Boolean = { fg = green:off_s(25) }

local stmt = ocean:off_v(25)
hi.Statement = { fg = stmt }
hi.Conditional = { fg = stmt:off_h(-5) }
hi.Repeat = { fg = stmt:off_h(-10) }

local type = purple:off_v(25)
hi.Type = { fg = type }
hi.StorageClass = { fg = type }
hi.Structure = { fg = type }
hi.Function = { fg = type:off_h(5), gui = 'bold' }

hi.Operator = { fg = green:off_h(3):off_s(50):off_v(10) }

hi.Keyword = { fg = ocean }
hi.Identifier = { fg = cyan }
hi.PreProc = { fg = pink }
hi.Label = { fg = yellow:off_h(5) }

hi.Special = { fg = pink }

-- semshi
hi.semshiLocal = { fg = pink }
hi.semshiImported = { fg = purple:off_h(15):off_v(50):off_s(-5) }
hi.semshiAttribute = { fg = cyan }
hi.semshiSelf = { fg = hsv(0.1, 0.5, 1.0) }
