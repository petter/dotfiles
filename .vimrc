set nocompatible            " be iMproved, required
filetype off                " required


" To install plugins call :PluginInstall in vim, 
" or call vim +PluginInstall +qall from command line 
" set the runtime path to include Vundle and initialize
set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()

Plugin 'VundleVim/Vundle.vim'

Plugin 'kien/ctrlp.vim'
Plugin 'itchyny/lightline.vim'


call vundle#end()			" required
filetype plugin indent on   " required

" Vim configs
set nu
set tabstop=4


" Plugin configs

"" CtrlP
set wildignore+=*/tmp/*,*.so,*.swp,*.zip,*/node_modules/*

"" Lightline
set laststatus=2

