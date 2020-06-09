" Use Bash for interopability
set shell=/bin/bash

" Prepare to load plugins
if empty(glob('~/.local/share/nvim/site/autoload/plug.vim'))
  silent !curl -fLo ~/.local/share/nvim/site/autoload/plug.vim --create-dirs
    \ https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
  autocmd VimEnter * PlugInstall --sync | source $MYVIMRC
endif

call plug#begin('~/.local/share/nvim/plugged')

" and load them!

" Highlight things what you yank
Plug 'machakann/vim-highlightedyank'

" Restrict modelines, not that I use them much
Plug 'ciaranm/securemodelines'

" Getting around is better with sneak and easymotion
Plug 'justinmk/vim-sneak'
Plug 'easymotion/vim-easymotion'

" Convenience for changing surrounds
Plug 'tpope/vim-surround'

" Commenting is better with nerd commenter
Plug 'scrooloose/nerdcommenter'

" And trees are better with nerdtree
Plug 'scrooloose/nerdtree'

" Use rooter to identify project roots for relative paths
Plug 'airblade/vim-rooter'

" Mission critical Emojis
Plug 'junegunn/vim-emoji'

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
Plug 'neoclide/coc.nvim', {'branch': 'release'}
Plug 'sirver/ultisnips'
Plug 'honza/vim-snippets'
Plug 'Konfekt/FastFold'

" Language specific things
Plug 'dag/vim-fish'
Plug 'rust-lang/rust.vim'
Plug 'cespare/vim-toml'
Plug 'godlygeek/tabular'
Plug 'gabrielelana/vim-markdown'
Plug 'stephpy/vim-yaml'
Plug 'pedrohdz/vim-yaml-folds'
Plug 'pangloss/vim-javascript'
Plug 'habamax/vim-asciidoctor'
Plug 'iloginow/vim-stylus'

" Git stuff
Plug 'airblade/vim-gitgutter'
Plug 'tpope/vim-fugitive'

" Editorconfig integration
Plug 'editorconfig/editorconfig-vim'

" Nord theme
Plug 'arcticicestudio/nord-vim'

" Sessions made simple
Plug 'tpope/vim-obsession'

call plug#end() " And plugins are done now!

" Implied by above, but just to be explicit
syntax enable
filetype plugin indent on
filetype plugin on
colorscheme nord

" Provider configuration
let g:loaded_ruby_provider = 0
let g:loaded_perl_provider = 0
let g:loaded_python_provider = 0 " disables python 2
let g:python3_host_prog = '{{ ansible_env.HOME  }}/.pyenv/versions/neovim3/bin/python'

" Lint settings
let g:ale_sign_column_always = 1
let g:ale_rust_cargo_use_check = 1
let g:ale_rust_cargo_check_all_targets = 1

" Set up ALE fixers
let g:ale_fixers = {
\   '*': ['remove_trailing_lines', 'trim_whitespace'],
\   'rust': ['rustfmt'],
\   'html': ['prettier'],
\   'markdown': ['prettier'],
\   'javascript': ['prettier'],
\   'typescript': ['prettier']
\}

" Customise nerd commenter
let g:NERDSpaceDelims=1
let g:NERDDefaultAlign = 'left'
let g:NERDTrimTrailingWhitespace = 1
let g:NERDCommentEmptyLines = 1

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

" Add more room for cmd message displays
set cmdheight=2

" And make the messages shorter
set shortmess+=c
 
" Spelling stuff
set spelllang=en_gb

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

" Not sure about this?
augroup mygroup
  autocmd!
  " Setup formatexpr specified filetype(s).
  autocmd FileType typescript,json setl formatexpr=CocAction('formatSelected')
  " Update signature help on jump placeholder
  autocmd User CocJumpPlaceholder call CocActionAsync('showSignatureHelp')
augroup end

" This is to 'accept' the completion
inoremap <expr><CR> complete_info()["selected"] != "-1" ? "\<C-y>" : "\<C-g>u\<CR>"

" Highlight symbol under cursor on CursorHold
autocmd CursorHold * silent call CocActionAsync('highlight')

" Wildmenu settings
set wildmenu
set wildmode=list:longest,full
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

" Asciidoc settings
let g:asciidoctor_folding = 1
let g:asciidoctor_fenced_languages = ['javascript']

" Function to create buffer local mappings
fun! AsciidoctorMappings()
	nnoremap <buffer> <leader>oo :AsciidoctorOpenRAW<CR>
	nnoremap <buffer> <leader>op :AsciidoctorOpenPDF<CR>
	nnoremap <buffer> <leader>oh :AsciidoctorOpenHTML<CR>
	nnoremap <buffer> <leader>ox :AsciidoctorOpenDOCX<CR>
	nnoremap <buffer> <leader>ch :Asciidoctor2HTML<CR>
	nnoremap <buffer> <leader>cp :Asciidoctor2PDF<CR>
	nnoremap <buffer> <leader>cx :Asciidoctor2DOCX<CR>
endfun

" Call AsciidoctorMappings for all `*.adoc` and `*.asciidoc` files
augroup asciidoctor
	au!
	au BufEnter *.adoc,*.asciidoc call AsciidoctorMappings()
augroup END

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
  \ 'colorscheme': 'nord',
  \ 'active': {
  \   'left': [ [ 'mode', 'paste' ],
  \             [ 'gitbranch', 'cocstatus', 'readonly', 'relativepath', 'modified' ] ],
  \   'right': [ [ 'lineinfo' ],
  \              [ 'percent' ],
  \              [ 'linter_checking', 'linter_errors', 'linter_warnings', 'linter_ok' ],
  \              [ 'fileencoding', 'filetype' ]] 
  \ },
  \ 'component_function': {
  \   'cocstatus': 'coc#status',
  \   'gitbranch': 'fugitive#head'
  \ },
  \ 'mode_map': {
  \ 'n' : 'N',
  \ 'i' : 'I',
  \ 'R' : 'R',
  \ 'v' : 'V',
  \ 'V' : 'VL',
  \ "\<C-v>": 'VB',
  \ 'c' : 'C',
  \ 's' : 'S',
  \ 'S' : 'SL',
  \ "\<C-s>": 'SB',
  \ 't': 'T',
  \ },
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

" Fast fold
let g:fastfold_savehook = 1
let g:fastfold_fold_command_suffixes =  ['x','X','a','A','o','O','c','C']
let g:fastfold_fold_movement_commands = [']z', '[z', 'zj', 'zk']
let g:markdown_folding = 1
let g:tex_fold_enabled = 1
let g:vimsyn_folding = 'af'
let g:xml_syntax_folding = 1
let g:javaScript_fold = 1
let g:sh_fold_enabled= 7
let g:ruby_fold = 1
let g:perl_fold = 1
let g:perl_fold_blocks = 1
let g:r_syntax_folding = 1
let g:rust_fold = 1
let g:php_folding = 1

" Use autocmd to force lightline update.
autocmd User CocStatusChange,CocDiagnosticChange call lightline#update()

" Ultisnips
let g:UltiSnipsExpandTrigger="<c-l>"
let g:UltiSnipsJumpForwardTrigger="<c-l>"
let g:UltiSnipsJumpBackwardTrigger="<s-tab>"

" Split window when editing snippets
let g:UltiSnipsEditSplit="vertical"

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

" Clever repeat sneaks
let g:sneak#s_next = 1

" Visual ruler
set colorcolumn=80

" Gimme them sweet sweet emojis
set completefunc=emoji#complete

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

" Remap : <-> ; to make ex commands easier
nnoremap : ;
nnoremap ; :

" Quick window movement
nnoremap <leader>k :wincmd k<CR>
nnoremap <leader>j :wincmd j<CR>
nnoremap <leader>h :wincmd h<CR>
nnoremap <leader>l :wincmd l<CR>

" Quick search with rg and Files
noremap <leader>s :Rg<CR>
noremap <leader>p :Files<CR>

" Quick access to the fugitive screen
noremap <leader>g :G<CR>

" ESC is too far, it turns out
inoremap <C-j> <Esc>

" Get a shortcut for fixers
nmap <leader>f <Plug>(ale_fix)

" Use K to show documentation in preview window
nnoremap <silent> K :call <SID>show_documentation()<CR>

function! s:show_documentation()
  if (index(['vim','help'], &filetype) >= 0)
    execute 'h '.expand('<cword>')
  else
    call CocAction('doHover')
  endif
endfunction

" Remap for rename current word
nmap <leader>rn <Plug>(coc-rename)

nmap <silent> gd <Plug>(coc-definition)
nmap <silent> gy <Plug>(coc-type-definition)
nmap <silent> gi <Plug>(coc-implementation)
nmap <silent> gr <Plug>(coc-references)

nnoremap <silent> <leader>R  :<C-u>CocList -I symbols<cr>
nnoremap <silent> <leader>r  :<C-u>CocList outline<cr>

inoremap <silent><expr> <c-space> coc#refresh()

" ALE quick jumps
nmap <silent> gpe <Plug>(ale_previous_wrap)
nmap <silent> gne <Plug>(ale_next_wrap)

" Nerd Tree toggle
nnoremap <leader>t :NERDTreeToggle<CR>

" Fugitive git merge
nnoremap <leader>gd :Gvdiffsplit!<CR>
nnoremap gdh :diffget //2<CR>
nnoremap gdl :diffget //3<CR>

" Quick config edit
nnoremap <leader>ev :split $MYVIMRC<CR>
nnoremap <leader>sv :source $MYVIMRC<CR>

" Fast fold
nmap zuz <Plug>(FastFoldUpdate)
