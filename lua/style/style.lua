local hi = require('style.hi')
local hsv = require('style.hsv')
-- vim.cmd('colorscheme prpl')
vim.cmd('colorscheme moonfly')

vim.g.moonflyCursorColor = 1
vim.g.moonflyUnderlineMatchParen = 1
vim.g.moonflyTerminalColors = 0

vim.g.lightline = { colorscheme = 'ayu_dark_variant' }

-- set font in gui
if vim.o.guifont then
  vim.o.guifont = 'Hermit,Symbola,unifont,DejaVu Sans,Noto Sans:h13:cDEFAULT'
end

-- terminal colors

vim.g.terminal_color_0 = '#02010a'
vim.g.terminal_color_1 = '#b2826a'
vim.g.terminal_color_2 = '#85ae6e'
vim.g.terminal_color_3 = '#4a45aa'
vim.g.terminal_color_4 = '#2b04aa'
vim.g.terminal_color_5 = '#390daa'
vim.g.terminal_color_6 = '#9f89aa'
vim.g.terminal_color_7 = '#c8c5c4'
vim.g.terminal_color_8 = '#5a524f'
vim.g.terminal_color_9 = '#b2826a'
vim.g.terminal_color_10 = '#85ae6e'
vim.g.terminal_color_11 = '#4a45aa'
vim.g.terminal_color_12 = '#2b04aa'
vim.g.terminal_color_13 = '#390daa'
vim.g.terminal_color_14 = '#9f89aa'
vim.g.terminal_color_15 = '#c8c5c4'

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
local altbg = bg:off_v(5)

hi.Normal = { fg = txt, bg = bg }
hi.LineNr = { fg = purple:off_v(10), bg = altbg }
hi.EndOfBuffer = { fg = purple:off_v(10), bg = black }
hi.CursorLineNr = { fg = pink, bg = altbg }
hi.CursorLine = { fg = fg, bg = bg }
hi.CursorColumn = { fg = fg, bg = bg }
hi.QuickFixLine = { fg = fg, bg = bg }

hi.TabLineFill = { bg = bg }

hi.BufferCurrent = { bg = altbg }
hi.BufferCurrentIndex = { bg = altbg }
hi.BufferCurrentMod = { bg = altbg }
hi.BufferCurrentSign = { bg = altbg }
hi.BufferInactive = { bg = bg }
hi.BufferVisible = { bg = bg }

hi.VertSplit = { bg = altbg }
hi.VertSplit = { bg = altbg }
hi.StatusLine = { bg = altbg }
hi.StatusLineNC = { bg = bg }
hi.StatusLineTerm = { bg = altbg }
hi.StatusLineTermNC = { bg = altbg }
hi.TabLine = { bg = altbg }
hi.TabLineFill = { bg = altbg }
hi.TabLineSel = { bg = altbg }
hi.FoldColumn = { bg = altbg }
hi.Folded = { bg = black:off_v(-15) }
hi.Visual = { bg = bg:off_v(10):off_h(5) }

hi.VisualNOS = { bg = bg }
hi.VisualInDiff = { bg = bg }
hi.DiffDelete = { bg = altbg }
hi.DiffChange = { bg = altbg }
hi.DiffDelete = { bg = altbg }

hi.fzf1 = { bg = altbg }
hi.fzf2 = { bg = altbg }
hi.fzf3 = { bg = altbg }

hi.Pmenu = { bg = bg:off_v(-10) }
hi.PmenuSel = { bg = altbg, fg = purple:off_v(10) }
hi.PmenuSbar = { bg = altbg }

local marker = bg:off_v(10):off_h(10)
hi.LspReferenceRead = { bg = marker }
hi.LspReferenceText = { bg = marker }
hi.LspReferenceWrite = { bg = marker }
