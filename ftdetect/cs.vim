
" Show type information automatically when the cursor stops moving.
" Note that the type is echoed to the Vim command line, and will overwrite
" any other messages in this space including e.g. ALE linting messages.
" autocmd CursorHold *.cs OmniSharpTypeLookup

" The following commands are contextual, based on the cursor position.
"nnoremap <buffer> gd :OmniSharpGotoDefinition<CR>
"nnoremap <buffer> gi :OmniSharpFindImplementations<CR>
"nnoremap <buffer> gs :OmniSharpFindSymbol<CR>
"nnoremap <buffer> gu :OmniSharpFindUsages<CR>

" Finds members in the current buffer
"nnoremap <buffer> gm :OmniSharpFindMembers<CR>

"nnoremap <buffer> <Leader>fx :OmniSharpFixUsings<CR>
"nnoremap <buffer> <Leader>tt :OmniSharpTypeLookup<CR>
"nnoremap <buffer> <Leader>dc :OmniSharpDocumentation<CR>
"nnoremap <buffer> <C-\> :OmniSharpSignatureHelp<CR>
"inoremap <buffer> <C-\> <C-o>:OmniSharpSignatureHelp<CR>

" Navigate up and down by method/property/field
"nnoremap <buffer> <C-k> :OmniSharpNavigateUp<CR>
"nnoremap <buffer> <C-j> :OmniSharpNavigateDown<CR>

" Find all code errors/warnings for the current solution and populate the quickfix window
"nnoremap <buffer> <Leader>cc :OmniSharpGlobalCodeCheck<CR>
