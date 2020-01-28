""""""""""""""""""""""""""""""""""""""""""
" Options
""""""""""""""""""""""""""""""""""""""""""

set encoding=utf-8
scriptencoding utf-8


"edit ------------------------------------

set tabstop=4
set softtabstop=2
set shiftwidth=2

set expandtab
set autoindent
set smartindent
set backspace=indent,eol,start
set wrapscan
set showmatch
set autoread
set hidden
set cursorline
set wildmode=list:longest
set novisualbell
set noerrorbells

"search ----------------------------------

set ignorecase
set smartcase
set wrapscan
set incsearch
set hlsearch

nmap <ESC><ESC> :nohlsearch<CR><Esc>

"screen ----------------------------------

set title
set number
set ruler
set nolist
set wrap
set laststatus=2
set showcmd
set showmode

"file ------------------------------------

set nobackup
set noswapfile
syntax on


"dein Scripts ----------------------------

if &compatible
  set nocompatible               " Be iMproved
endif

" Required:
set runtimepath+=/Users/kirohi/.dotfiles/.vim/bundle/repos/github.com/Shougo/dein.vim

" Required:
if dein#load_state('/Users/kirohi/.dotfiles/.vim/bundle')
  call dein#begin('/Users/kirohi/.dotfiles/.vim/bundle')

  " Let dein manage dein
  " Required:
  call dein#add('/Users/kirohi/.dotfiles/.vim/bundle/repos/github.com/Shougo/dein.vim')

  " Add or remove your plugins here like this:
  "call dein#add('Shougo/neosnippet.vim')
  "call dein#add('Shougo/neosnippet-snippets')

  " Required:
  call dein#end()
  call dein#save_state()
endif

" Required:
filetype plugin indent on
syntax enable

" If you want to install not installed plugins on startup.
"if dein#check_install()
"  call dein#install()
"endif

"End dein Scripts-------------------------
