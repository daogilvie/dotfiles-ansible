" This config contains only plugin loads.
" All settings, keymaps and autocmds are in plugin/*.vim files.

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

" Restrict modelines, not that I use them much
Plug 'ciaranm/securemodelines'

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

" Treesitter for AST magic
Plug 'nvim-treesitter/nvim-treesitter', {'do': ':TSUpdate'}

" Undotree for the undo magic
Plug 'mbbill/undotree'

" Telescope for all the searchy listy goodness
Plug 'nvim-lua/popup.nvim'
Plug 'nvim-lua/plenary.nvim'
Plug 'nvim-telescope/telescope.nvim'
Plug 'nvim-telescope/telescope-fzy-native.nvim'
Plug 'kyazdani42/nvim-web-devicons'

" Enable various language server, completion and linting integrations
Plug 'autozimu/LanguageClient-neovim', {
    \ 'branch': 'next',
    \ 'do': 'bash install.sh',
    \ } "
Plug 'Shougo/echodoc.vim' " show docs in the bottom area
Plug 'neoclide/coc.nvim', {'branch': 'release'}
Plug 'tpope/vim-dispatch'

" Snippets
Plug 'sirver/ultisnips'
Plug 'honza/vim-snippets'

" Quality-of-life improvements
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
Plug 'pprovost/vim-ps1'
Plug 'tmhedberg/SimpylFold'
Plug 'fatih/vim-go'
Plug 'evanleck/vim-svelte'

" Git stuff
Plug 'airblade/vim-gitgutter'
Plug 'tpope/vim-fugitive'
Plug 'tpope/vim-rhubarb'
Plug 'ruanyl/vim-gh-line'
Plug 'junegunn/gv.vim'

" Editorconfig integration
Plug 'editorconfig/editorconfig-vim'

" Nord theme
Plug 'arcticicestudio/nord-vim'

" Sessions made simple
Plug 'tpope/vim-obsession'

" Window management with maximizer
Plug 'szw/vim-maximizer'

call plug#end() " And plugins are done now!
