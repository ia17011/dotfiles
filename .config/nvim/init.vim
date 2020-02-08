" ------------------------------------------------------------
"  key bind
" ------------------------------------------------------------
" Normal Mode
cnoremap init :<C-u>edit $MYVIMRC<CR>                           " init.vim呼び出し
noremap <Space>s :source $MYVIMRC<CR>                           " init.vim読み込み
noremap <Space>w :<C-u>w<CR>                                    " ファイル保存

" Insert Mode
inoremap <silent> jj <ESC>:<C-u>w<CR>:" InsertMode抜けて保存
" Insert mode movekey bind
inoremap <C-d> <BS>
inoremap <C-h> <Left>                                                                                                                 
inoremap <C-l> <Right>
inoremap <C-k> <Up>                          
inoremap <C-j> <Down>

" ------------------------------------------------------------
"  dein vim
" ------------------------------------------------------------

if &compatible
  set nocompatible
endif
set runtimepath+=~/.cache/dein/repos/github.com/Shougo/dein.vim
if dein#load_state('~/.cache/dein')
  call dein#begin('~/.cache/dein')
  call dein#load_toml('~/.dotfiles/.config/nvim/dein.toml', {'lazy': 0}) " Neovim起動時にロード
  call dein#load_toml('~/.dotfiles/.config/nvim/lazy.toml', {'lazy': 1}) " Plugin使用の際にロード
  call dein#end()
  call dein#save_state()
endif
filetype plugin indent on
syntax enable

" ------------------------------------------------------------
"  settings
" ------------------------------------------------------------
set encoding=utf-8

set number
set splitbelow
set splitright
set noequalalways
set wildmenu
set ruler
set cursorline
set autoindent
set tabstop=2
set shiftwidth=2
set expandtab
set splitright
set clipboard=unnamed
