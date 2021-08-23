" Remap for rename current word
nmap <leader>rn <Plug>(coc-rename)

" Get a shortcut for fixers
nmap <leader>ff <Plug>(coc-format)
vmap <leader>fs <Plug>(coc-format-selected)

" Use K to show documentation in preview window
nnoremap <silent> K :call <SID>show_documentation()<CR>

function! s:show_documentation()
  if (index(['vim','help'], &filetype) >= 0)
    execute 'h '.expand('<cword>')
  else
    call CocAction('doHover')
  endif
endfunction

" Use tab for trigger completion with characters ahead and navigate.
" Use command ':verbose imap <tab>' to make sure tab is not mapped by other plugin.
inoremap <silent><expr> <TAB>
      \ pumvisible() ? "\<C-n>" :
      \ <SID>check_back_space() ? "\<TAB>" :
      \ coc#refresh()
inoremap <expr><S-TAB> pumvisible() ? "\<C-p>" : "\<C-h>"

function! s:check_back_space() abort
  let col = col('.') - 1
  return !col || getline('.')[col - 1]  =~# '\s'
endfunction

" This is to 'accept' the completion
inoremap <expr><CR> complete_info()["selected"] != "-1" ? "\<C-y>" : "\<C-g>u\<CR>"

" COC related autocmds
augroup cocgubbins
  autocmd!
  " Setup formatexpr specified filetype(s).
  autocmd FileType typescript,json setl formatexpr=CocAction('formatSelected')
  " Update signature help on jump placeholder
  autocmd User CocJumpPlaceholder call CocActionAsync('showSignatureHelp')
  " Update lighline when coc reports new status/diagnostics
  autocmd User CocStatusChange,CocDiagnosticChange call lightline#update()
  " Highlight symbol under cursor on CursorHold
  autocmd CursorHold * silent call CocActionAsync('highlight')
augroup end

" gh copies the line
let g:gh_open_command = 'fn() { echo "$@" | pbcopy; }; fn '

" Customise nerd commenter
let g:NERDSpaceDelims=1
let g:NERDDefaultAlign = 'left'
let g:NERDTrimTrailingWhitespace = 1
let g:NERDCommentEmptyLines = 1

" Snippet config
let g:ultisnips_python_style = 'google'
let g:UltiSnipsExpandTrigger="<c-l>"
let g:UltiSnipsJumpForwardTrigger="<c-l>"
let g:UltiSnipsJumpBackwardTrigger="<s-tab>"
let g:UltiSnipsEditSplit="vertical"

" DoGe config options!
let g:doge_mapping = '<leader>D'
let g:doge_mapping_comment_jump_forward = '<leader><tab>'
let g:doge_mapping_comment_jump_backward = '<leader><s-tab>'
let g:doge_doc_standard_python = 'google'
