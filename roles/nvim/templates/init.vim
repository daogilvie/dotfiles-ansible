" Use Bash for interopability
set shell=/bin/bash

" Prepare to load plugins
call plug#begin('~/.local/share/nvim/plugged')

" and load them!

" Highlight things what you yank
Plug 'machakann/vim-highlightedyank'

" Restrict modelines, not that I use them much
Plug 'ciaranm/securemodelines'

" Getting around is better with sneak
Plug 'justinmk/vim-sneak'

" Commenting is better with nerd commenter
Plug 'scrooloose/nerdcommenter'

" Use rooter to identify project roots for relative paths
Plug 'airblade/vim-rooter'

" Add a statusline - I use a powerline-ish theme in terminal, but don't want
" to install powerline proper. Lightline seems good.
Plug 'itchyny/lightline.vim'

" FZF integration
Plug 'junegunn/fzf', { 'dir': '~/.fzf', 'do': './install --all' }
Plug 'junegunn/fzf.vim'

" Enable various language server, completion and linting integrations
Plug 'w0rp/ale' " asynchronous lints with ale
Plug 'autozimu/LanguageClient-neovim', {
    \ 'branch': 'next',
    \ 'do': 'bash install.sh',
    \ } "
Plug 'Shougo/echodoc.vim' " show docs in the bottom area
Plug 'ncm2/ncm2' " completions with ncm2 and some sources
Plug 'roxma/nvim-yarp'
Plug 'ncm2/ncm2-bufword'
Plug 'ncm2/ncm2-tmux'
Plug 'ncm2/ncm2-path'

" Language specific things
Plug 'dag/vim-fish'
Plug 'rust-lang/rust.vim'
Plug 'cespare/vim-toml'

" Editorconfig integration
Plug 'editorconfig/editorconfig-vim'

" Dracula mode
Plug 'dracula/vim', { 'as': 'dracula' }

call plug#end() " And plugins are done now!

" Implied by above, but just to be explicit
syntax enable
filetype plugin indent on
filetype plugin on
color dracula

" Python configuration
let g:python_host_prog = '{{ ansible_env.HOME  }}/.pyenv/versions/neovim2/bin/python'
let g:python3_host_prog = '{{ ansible_env.HOME  }}/.pyenv/versions/neovim3/bin/python'
" Lint settings
let g:ale_sign_column_always = 1
" only lint on save
let g:ale_lint_on_text_changed = 'never'
let g:ale_lint_on_save = 0
let g:ale_lint_on_enter = 0
let g:ale_rust_cargo_use_check = 1
let g:ale_rust_cargo_check_all_targets = 1
let g:ale_virtualtext_cursor = 0

" from https://github.com/jonhoo/configs/blob/master/editor/.config/nvim/init.vim
" which cites http://sheerun.net/2014/03/21/how-to-boost-your-vim-productivity/
if executable('ag')
	set grepprg=ag\ --nogroup\ --nocolor
endif
if executable('rg')
	set grepprg=rg\ --no-heading\ --vimgrep
	set grepformat=%f:%l:%c:%m
endif
if executable('fzy')
    function! FzyCommand(choice_command, vim_command)
        try
            let output = system(a:choice_command . " | fzy ")
        catch /Vim:Interrupt/
            " Swallow errors from ^C, allow redraw! below
        endtry
        redraw!
        if v:shell_error == 0 && !empty(output)
            exec a:vim_command . ' ' . output
        endif
    endfunction
endif

" Don't need backups and swaps
set nobackup
set nowb
set noswapfile
set autoread

" Persist undo buffers to disk
set undodir=~/.vimdid
set undofile

" Completion settings taken from jonhoo
autocmd BufEnter * call ncm2#enable_for_buffer()
set completeopt=noinsert,menuone,noselect
" tab to select
" and don't hijack my enter key
inoremap <expr><Tab> (pumvisible()?(empty(v:completed_item)?"\<C-n>":"\<C-y>"):"\<Tab>")
inoremap <expr><CR> (pumvisible()?(empty(v:completed_item)?"\<CR>\<CR>":"\<C-y>"):"\<CR>")

" Lang server, taken from jonhoo
let g:LanguageClient_settingsPath = "~/.config/nvim/langclient.json"
let g:LanguageClient_serverCommands = {
    \ 'rust': ['env', 'CARGO_TARGET_DIR=/data/jon/cargo-target/rls', 'rls'],
    \ }
let g:LanguageClient_autoStart = 1
nnoremap <silent> K :call LanguageClient_textDocument_hover()<CR>
nnoremap <silent> gd :call LanguageClient_textDocument_definition()<CR>
nnoremap <silent> <F2> :call LanguageClient_textDocument_rename()<CR>

" Wildmenu settings
set wildmenu
set wildmode=list:longest
set wildignore=.hg,.svn,*~,*.png,*.jpg,*.gif,*.settings,Thumbs.db,*.min.js,*.swp,publish/*,intermediate/*,*.o,*.hi,Zend,vendor

" Defaults are spaces not tabs, editorconfig can override these
set tabstop=4
set softtabstop=4
set shiftwidth=4
set expandtab
set autoindent
set copyindent

" Ignore case when searching
set ignorecase

" When searching try to be smart about cases
set smartcase

" Highlight search results
set hlsearch

" Makes search act like search in modern browsers
set incsearch

" Backspace no longer fears the newline!
set backspace=2

" Jonhoo's Rg config
let g:fzf_layout = { 'down': '~20%' }
command! -bang -nargs=* Rg
  \ call fzf#vim#grep(
  \   'rg --column --line-number --no-heading --color=always '.shellescape(<q-args>), 1,
  \   <bang>0 ? fzf#vim#with_preview('up:60%')
  \           : fzf#vim#with_preview('right:50%:hidden', '?'),
  \   <bang>0)

function! s:list_cmd()
  let base = fnamemodify(expand('%'), ':h:.:S')
  return base == '.' ? 'fd --type file --follow' : printf('fd --type file --follow | proximity-sort %s', expand('%'))
endfunction

command! -bang -nargs=? -complete=dir Files
  \ call fzf#vim#files(<q-args>, {'source': s:list_cmd(),
  \                               'options': '--tiebreak=index'}, <bang>0)


" Status bar!
set laststatus=2
let g:lightline = {
  \ 'colorscheme': 'dracula'
  \}
set noshowmode
" Some autocommand stuff
"
" Line numbers are hybrid: relative except when not focused or in INSERT, when they
" are absolute
set number relativenumber
augroup numbertoggle
  autocmd!
  autocmd BufEnter,FocusGained,InsertLeave * set relativenumber
  autocmd BufLeave,FocusLost,InsertEnter   * set norelativenumber
augroup END

" Turn off paste mode when leaving insert
autocmd InsertLeave * set nopaste

" ----------
" Key Remaps
" ----------

let mapleader = ","

" Make myself learn the home row, arrow keys do nothing except
" switch buffers in normal mode
nnoremap <up> <nop>
nnoremap <down> <nop>
inoremap <up> <nop>
inoremap <down> <nop>
inoremap <left> <nop>
inoremap <right> <nop>
nnoremap <left> :bp<CR>
nnoremap <right> :bn<CR>

" Write quickly
nmap <leader>w :w<CR>

" quick search with rg
noremap <leader>s :Rg

" ESC is too far, it turns out
inoremap <C-j> <Esc>
