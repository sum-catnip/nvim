" fg
let s:base1 = '#c8c5c4'
let s:base2 = '#c8c5c4'
let s:base3 = '#c8c5c4'

" ?
let s:base00 = '#ff0000'
let s:base03 = '#ff0000'

let s:base01 = '#080913'
let s:base02 = '#05060f'
let s:base023 = '#05060f'
let s:base0 = '#9899a3'

let s:yellow = '#e3c78a'
let s:orange = '#de935f'
let s:red = '#ff5454'
let s:magenta = '#ae81ff'
let s:blue = '#74b2ff'
let s:cyan = s:blue
let s:green = '#85dc85'

let s:p = {'normal': {}, 'inactive': {}, 'insert': {}, 'replace': {}, 'visual': {}, 'tabline': {}}
let s:p.normal.left = [ [ s:base02, s:blue ], [ s:base3, s:base01 ] ]
let s:p.normal.middle = [ [ s:base2, s:base02 ] ]
let s:p.normal.right = [ [ s:base02, s:base0 ], [ s:base1, s:base01 ] ]
let s:p.inactive.left =  [ [ s:base1, s:base01 ], [ s:base3, s:base01 ] ]
let s:p.inactive.middle = [ [ s:base1, s:base023 ] ]
let s:p.inactive.right = [ [ s:base1, s:base01 ], [ s:base2, s:base02 ] ]
let s:p.insert.left = [ [ s:base02, s:green ], [ s:base3, s:base01 ] ]
let s:p.replace.left = [ [ s:base023, s:red ], [ s:base3, s:base01 ] ]
let s:p.visual.left = [ [ s:base02, s:magenta ], [ s:base3, s:base01 ] ]
let s:p.tabline.tabsel = [ [ s:base02, s:base03 ] ]
let s:p.tabline.left = [ [ s:base3, s:base00 ] ]
let s:p.tabline.middle = [ [ s:base2, s:base02 ] ]
let s:p.tabline.right = [ [ s:base2, s:base00 ] ]
let s:p.normal.error = [ [ s:base03, s:red ] ]
let s:p.normal.warning = [ [ s:base023, s:yellow ] ]

let g:lightline#colorscheme#ayu_dark_variant#palette = lightline#colorscheme#fill(s:p)
