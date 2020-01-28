if g:dein#_cache_version !=# 150 || g:dein#_init_runtimepath !=# '/Users/kirohi/.vim,/usr/share/vim/vimfiles,/usr/share/vim/vim81,/usr/share/vim/vimfiles/after,/Users/kirohi/.vim/after,/Users/kirohi/.dotfiles/.vim/bundle/repos/github.com/Shougo/dein.vim' | throw 'Cache loading error' | endif
let [plugins, ftplugin] = dein#load_cache_raw(['/Users/kirohi/.vimrc'])
if empty(plugins) | throw 'Cache loading error' | endif
let g:dein#_plugins = plugins
let g:dein#_ftplugin = ftplugin
let g:dein#_base_path = '/Users/kirohi/.dotfiles/.vim/bundle'
let g:dein#_runtime_path = '/Users/kirohi/.dotfiles/.vim/bundle/.cache/.vimrc/.dein'
let g:dein#_cache_path = '/Users/kirohi/.dotfiles/.vim/bundle/.cache/.vimrc'
let &runtimepath = '/Users/kirohi/.vim,/usr/share/vim/vimfiles,/Users/kirohi/.dotfiles/.vim/bundle/repos/github.com/Shougo/dein.vim,/Users/kirohi/.dotfiles/.vim/bundle/.cache/.vimrc/.dein,/usr/share/vim/vim81,/Users/kirohi/.dotfiles/.vim/bundle/.cache/.vimrc/.dein/after,/usr/share/vim/vimfiles/after,/Users/kirohi/.vim/after'
filetype off
