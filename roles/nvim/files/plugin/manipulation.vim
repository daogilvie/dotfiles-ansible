" Emojify
nnoremap <leader>el :%s/:\([^:]\+\):/\=emoji#for(submatch(1), submatch(0))/g<CR>

" Primeagen and asbjornHaland's 'Greatest remaps ever'
vnoremap <leader>p "_dP
nnoremap <leader>y "+y
vnoremap <leader>y "+y
nnoremap <leader>Y gg"+yG

" More black hole deletion
nnoremap <leader>d "_d
vnoremap <leader>d "_d

" Undotree toggle
nnoremap <leader>u :UndotreeShow<CR>
