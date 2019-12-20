" Use Bash for interopability
set shell=/bin/bash

" Prepare to load plugins
call plug#begin('~/.local/share/nvim/plugged')

" and load them!

" Highlight things what you yank
Plug 'machakann/vim-highlightedyank'

" Restrict modelines, not that I use them much
Plug 'ciaranm/securemodelines'

" Getting around is better with sneak and easymotion
Plug 'justinmk/vim-sneak'
Plug 'easymotion/vim-easymotion'

" Commenting is better with nerd commenter
Plug 'scrooloose/nerdcommenter'

" Use rooter to identify project roots for relative paths
Plug 'airblade/vim-rooter'

" Add a statusline - I use a powerline-ish theme in terminal, but don't want
" to install powerline proper. Lightline seems good.
Plug 'itchyny/lightline.vim'
Plug 'maximbaz/lightline-ale'

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
Plug 'godlygeek/tabular'
Plug 'plasticboy/vim-markdown'
Plug 'stephpy/vim-yaml'
Plug 'pangloss/vim-javascript'

" Git Gutter
Plug 'airblade/vim-gitgutter'

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
let g:ale_rust_cargo_use_check = 1
let g:ale_rust_cargo_check_all_targets = 1

" Vim gutter settings
set updatetime=100

" from https://github.com/jonhoo/configs/blob/master/editor/.config/nvim/init.vim
" which cites http://sheerun.net/2014/03/21/how-to-boost-your-vim-productivity/
if executable('ag')
	set grepprg=ag\ --nogroup\ --nocolor
endif
if executable('rg')
	set grepprg=rg\ --no-heading\ --vimgrep
	set grepformat=%f:%l:%c:%m
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
    \ 'rust': ['rls'],
    \ }
let g:LanguageClient_autoStart = 1
nnoremap <silent> K :call LanguageClient_textDocument_hover()<CR>
nnoremap <silent> gd :call LanguageClient_textDocument_definition()<CR>
nnoremap <silent> <F2> :call LanguageClient_textDocument_rename()<CR>

" Remap : <-> ; to make ex commands easier
nnoremap : ;
nnoremap ; :

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

" Folding via syntax files, and everything 3 layers in is folded
set foldmethod=syntax
set foldlevel=3

" Splits open down and to the right, the opposites of defaults
set splitbelow splitright

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

" Status bar!
set laststatus=2
let g:lightline = {
  \ 'colorscheme': 'dracula'
  \}
let g:lightline.component_expand = {
      \  'linter_checking': 'lightline#ale#checking',
      \  'linter_warnings': 'lightline#ale#warnings',
      \  'linter_errors': 'lightline#ale#errors',
      \  'linter_ok': 'lightline#ale#ok',
      \ }
let g:lightline.component_type = {
      \     'linter_checking': 'left',
      \     'linter_warnings': 'warning',
      \     'linter_errors': 'error',
      \     'linter_ok': 'left',
      \ }
let g:lightline.active = { 'right': [[ 'linter_checking', 'linter_errors', 'linter_warnings', 'linter_ok' ]] }

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

" Add ** to path to let find use sub-directories
set path+=**

" ----------
" Key Remaps
" ----------

let mapleader = "\<SPACE>"

" Make myself learn the home row, arrow keys do nothing except
" switch buffers in normal mode
nnoremap <up> <nop>
nnoremap <down> <nop>
inoremap <up> <nop>
inoremap <down> <nop>
inoremap <left> <nop>
inoremap <right> <nop>

" Write quickly
noremap <leader>w :w<CR>

" quick search with rg
noremap <leader>s :Rg<CR>
noremap <leader>f :Files<CR>

" ESC is too far, it turns out
inoremap <C-j> <Esc>
