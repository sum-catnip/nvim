" language en_US
lua require 'init'

" get highlighting group under cursor
map <F10> :echo "hi<" . synIDattr(synID(line("."),col("."),1),"name") . '> trans<'
\ . synIDattr(synID(line("."),col("."),0),"name") . "> lo<"
\ . synIDattr(synIDtrans(synID(line("."),col("."),1)),"name") . ">"<CR>

call plug#begin(stdpath('data') . '/plugged')

Plug 'dag/vim-fish'
Plug 'Yggdroot/LeaderF', { 'do': './install.sh' }
Plug 'mhartington/oceanic-next'
Plug 'psliwka/vim-smoothie'
Plug 'vim-airline/vim-airline'
Plug 'henrynewcomer/vim-theme-papaya'
Plug 'cseelus/vim-colors-lucid'
Plug 'ajmwagar/vim-deus'
Plug 'tyrannicaltoucan/vim-deep-space'
Plug 'neoclide/coc.nvim', {'branch': 'release'}
Plug 'jaxbot/semantic-highlight.vim'
Plug 'justinmk/vim-sneak'
Plug 'jreybert/vimagit'
Plug 'OmniSharp/omnisharp-vim'
Plug 'w0rp/ale'
Plug 'preservim/nerdtree'
Plug 'nvim-treesitter/nvim-treesitter'

call plug#end()


colorscheme deep-space
let g:airline_theme='deep_space'
let g:oceanic_next_terminal_italic = 1
let g:oceanic_next_terminal_bold = 1
let g:deepspace_italics=1

" treesitter
lua <<EOF
require'nvim-treesitter.configs'.setup {
  ensure_installed = "python", -- one of "all", "language", or a list of languages
  highlight = {
    enable = true -- false will disable the whole extension
  },
  refactor = {
    highlight_definitions = { enable = true }
  }
}
EOF

" disable colorschemes bg color
" highlight Normal ctermbg=none guibg=none
" highlight SignColumn ctermbg=none guibg=none
" highlight LineNr ctermbg=none guibg=none
" highlight EndOfBuffer ctermbg=none guibg=none

" leader f settings
let g:Lf_WindowPosition = 'popup'
let g:Lf_PreviewInPopup = 1
let g:Lf_ShortcutF = "<leader>ff"
noremap <leader>fb :<C-U><C-R>=printf("Leaderf buffer %s", "")<CR><CR>
noremap <leader>fm :<C-U><C-R>=printf("Leaderf mru %s", "")<CR><CR>
noremap <leader>ft :<C-U><C-R>=printf("Leaderf bufTag %s", "")<CR><CR>
noremap <leader>fl :<C-U><C-R>=printf("Leaderf line %s", "")<CR><CR>
noremap <leader>fc :<C-U><C-R>=printf("Leaderf command %s", "")<CR><CR>

if (has("termguicolors"))
    set termguicolors
    let kektop = synIDattr(hlID("Normal"), "bg#")
endif

" coc

set hidden
set nobackup
set nowritebackup

set cmdheight=2
set updatetime=300
set shortmess+=c
set signcolumn=no

" tab to trigger completion
inoremap <silent><expr> <TAB>
    \ pumvisible() ? "\<C-n>" :
    \ <SID>check_back_space() ? "\<TAB>" :
    \ coc#refresh()
inoremap <expr><S-TAB> pumvisible() ? "\<C-p>" : "\<C-h>"

function! s:check_back_space() abort
    let col = col('.') - 1
    return !col || getline('.')[col - 1] =~# '\s'
endfunction

" use c-space to trigger completion
inoremap <silent><expr> <c-space> coc#refresh()

" <cr> to confirm completion
" <C-g>u to break undo chain
inoremap <expr> <cr> pumvisible() ? "\<C-y>" : "\<C-g>u\<CR>"

" [g and ]g to navigate diagnostics
nmap <silent> [g <Plug>(coc-diagnostics-prev)
nmap <silent> ]g <Plug>(coc-diagnostics-next)

" gotos
nmap <silent> gd <Plug>(coc-definition)
nmap <silent> gy <Plug>(coc-type-definition)
nmap <silent> gi <Plug>(coc-implementation)
nmap <silent> gr <Plug>(coc-references)

" k for documentation
nnoremap <silent> K :call <SID>show_documentation()<CR>

function! s:show_documentation()
  if (index(['vim','help'], &filetype) >= 0)
    execute 'h '.expand('<cword>')
  else
    call CocAction('doHover')
  endif
endfunction

" highlight symbol under cursor
autocmd CursorHold * silent call CocActionAsync('highlight')

" rename
nmap <leader>rn <Plug>(coc-rename)

" format
xmap <leader>f  <Plug>(coc-format-selected)
nmap <leader>f  <Plug>(coc-format-selected)

augroup mygroup
  autocmd!
  " Setup formatexpr specified filetype(s).
  autocmd FileType typescript,json setl formatexpr=CocAction('formatSelected')
  " Update signature help on jump placeholder
  autocmd User CocJumpPlaceholder call CocActionAsync('showSignatureHelp')
augroup end

" code action region
xmap <leader>.  <Plug>(coc-codeaction-selected)
nmap <leader>.  <Plug>(coc-codeaction-selected)

" code action line
nmap <leader>ac  <Plug>(coc-codeaction)
nmap <leader>qf  <Plug>(coc-fix-current)

" function test obj
xmap if <Plug>(coc-funcobj-i)
xmap af <Plug>(coc-funcobj-a)
omap if <Plug>(coc-funcobj-i)
omap af <Plug>(coc-funcobj-a)

" <TAB> fir sekection ranges
nmap <silent> <TAB> <Plug>(coc-range-select)
xmap <silent> <TAB> <Plug>(coc-range-select)

" format current buffer
command! -nargs=0 Format :call CocAction('format')

" fold buffer
command! -nargs=? Fold :call CocAction('fold', <f-args>)

" :or ganize imports
command! -nargs=0 OR :call CocAction('runCommand', 'editor.action.organizeImport')

" status line support
set statusline^=%{coc#status()}%{get(b:,'coc_current_function','')}

" all diagnostics
nnoremap <silent> <leader>ad  :<C-u>CocList diagnostics<cr>

" extentions
nnoremap <silent> <leader>ex  :<C-u>CocList extensions<cr>

" commands
nnoremap <silent> <leader>c  :<C-u>CocList commands<cr>

" symbol of current doc
nnoremap <silent> <leader>o  :<C-u>CocList outline<cr>

" workspace symbols
nnoremap <silent> <leader>s  :<C-u>CocList -I symbols<cr>

" default action for next item
nnoremap <silent> <leader>j  :<C-u>CocNext<CR>

" default action for prev item
nnoremap <silent> <leader>k  :<C-u>CocPrev<CR>

" resume latest coc list
nnoremap <silent> <leader>p  :<C-u>CocListResume<CR>

" yank menu
nnoremap <silent> <leader>y  :<C-u>CocList -A --normal yank<cr>

" Remap for do codeAction of selected region
function! s:cocActionsOpenFromSelected(type) abort
  execute 'CocCommand actions.open ' . a:type
endfunction
xmap <silent> <leader>aa :<C-u>execute 'CocCommand actions.open ' . visualmode()<CR>
nmap <silent> <leader>aa :<C-u>set operatorfunc=<SID>cocActionsOpenFromSelected<CR>g@

autocmd CursorHold * silent call CocActionAsync('highlight')

let g:OmniSharp_server_path = 'D:\Programs\omnisharpvim-fix\stdioproxy.exe'
let g:OmniSharp_server_stdio = 1
let g:OmniSharp_timeout = 10
" set completeopt=longest,menuone,preview
set previewheight=5
let g:ale_linters = { 'cs': ['OmniSharp'] }
let g:OmniSharp_highlight_types = 3

map <C-n> :NERDTreeToggle<CR>
