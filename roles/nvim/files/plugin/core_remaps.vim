" Write quickly
noremap <leader>w :w<CR>

" Quick config edit
nnoremap <leader>ev :split $MYVIMRC<CR>
nnoremap <leader>sv :source $MYVIMRC<CR>

" Remap : <-> ; to make ex commands easier
nnoremap : ;
nnoremap ; :

" ESC is too far, it turns out
inoremap <C-j> <Esc>
