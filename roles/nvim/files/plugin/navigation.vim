" Nerd Tree toggle
nnoremap <leader>t :NERDTreeToggle<CR>

" And find-current
nnoremap <leader>ft :NERDTreeFind<CR>

" Quick window movement
nnoremap <leader>k :wincmd k<CR>
nnoremap <leader>j :wincmd j<CR>
nnoremap <leader>h :wincmd h<CR>
nnoremap <leader>l :wincmd l<CR>

" Make myself learn the home row, arrow keys do nothing except
" switch buffers in normal mode
nnoremap <up> <nop>
nnoremap <down> <nop>
inoremap <up> <nop>
inoremap <down> <nop>
inoremap <left> <nop>
inoremap <right> <nop>

" Quick project-wide search with Rg and Files
noremap <C-f> :lua require('telescope.builtin').live_grep() <CR>
noremap <C-p> :lua require('telescope.builtin').git_files()<CR>
noremap <leader>p :lua require('telescope.builtin').buffers()<CR>
nnoremap <leader>fw :lua require('telescope.builtin').grep_string { search = vim.fn.expand("<cword>") }<CR>
nnoremap <leader>rw :CocSearch <C-R>=expand("<cword>")<CR><CR>

" Code-based navigations, like definition, references, outline etc
nmap <silent> gd <Plug>(coc-definition)
nmap <silent> gy <Plug>(coc-type-definition)
nmap <silent> gi <Plug>(coc-implementation)
nmap <silent> gr <Plug>(coc-references)
nnoremap <silent> <leader>R  :<C-u>CocList -I symbols<cr>
nnoremap <silent> <leader>r  :<C-u>CocList outline<cr>

" Quick diagnostic jumps (not simply loclist)
nmap <silent> [e <Plug>(coc-diagnostic-prev)
nmap <silent> ]e <Plug>(coc-diagnostic-next)

" Quickfix and loclist navigation
nnoremap ]q :cnext<CR>zz
nnoremap [q :cprev<CR>zz
nnoremap <C-k> :lnext<CR>zz
nnoremap <C-j> :lprev<CR>zz

" Folds
nnoremap zuz <Plug>(FastFoldUpdate)
