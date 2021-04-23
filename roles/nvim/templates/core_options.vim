syntax enable
filetype plugin indent on
filetype plugin on
colorscheme nord

let mapleader = "\<SPACE>"

" Emoji completion
set completefunc=emoji#complete

" Vim gutter settings
set updatetime=100
"
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

" Ignore case when searching, unless case is different in the search string
set ignorecase
set smartcase

" Highlight search results
set hlsearch

" Perform search as it is being typed
set incsearch

" Backspace no longer fears the newline!
set backspace=2

" Folding via syntax files, and everything 3 layers in is folded
set foldmethod=syntax
set foldlevel=3

" Splits open down and to the right, the opposites of defaults
set splitbelow splitright

" Status bar!
set laststatus=2

" Line numbers are hybrid: relative except when not focused or in INSERT, when they
" are absolute
set number relativenumber
augroup numbertoggle
  autocmd!
  autocmd BufEnter,FocusGained,InsertLeave * set relativenumber
  autocmd BufLeave,FocusLost,InsertEnter   * set norelativenumber
augroup END

" Add ** to path to let find use sub-directories
set path+=**

" Visual ruler
set colorcolumn=80

" Scroll before reaching edges
set scrolloff=9

" Use the sign column
set signcolumn=yes

" Turn off paste mode when leaving insert
autocmd InsertLeave * set nopaste

" Provider configuration
let g:loaded_ruby_provider = 0
let g:loaded_perl_provider = 0
let g:loaded_python_provider = 0 " disables python 2
let g:python3_host_prog = '{{ ansible_env.HOME  }}/.config/nvim/neovim_venv/bin/python'

augroup highlight_yank
    autocmd!
    autocmd TextYankPost * silent! lua require'vim.highlight'.on_yank({timeout = 300})
augroup END
