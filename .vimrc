set nocompatible            " be iMproved, required
filetype off                " required


" To install plugins call :PluginInstall in vim, 
" or call vim +PluginInstall +qall from command line 
" set the runtime path to include Vundle and initialize
set rtp+=~/.vim/bundle/Vundle.vim
set rtp+=~/.fzf

call vundle#begin()

Plugin 'VundleVim/Vundle.vim'

Plugin 'itchyny/lightline.vim'
Plugin 'terryma/vim-multiple-cursors'
Plugin 'tpope/vim-eunuch'
Plugin 'tpope/vim-surround'
Plugin 'scrooloose/nerdtree'
Plugin 'mattn/emmet-vim'
Plugin 'w0rp/ale'
Plugin 'Valloric/YouCompleteMe'
Plugin 'airblade/vim-gitgutter'


call vundle#end()			" required
filetype plugin indent on   " required

" Vim configs
set nu
filetype plugin indent on
set tabstop=4
set shiftwidth=4
set expandtab

"" Mappings
nnoremap Q @q
vnoremap Q :norm @q<cr>

noremap <C-l> <C-w>l
noremap <C-h> <C-w>h
noremap <C-j> <C-w>j
noremap <C-k> <C-w>k

noremap <C-x> :FZF<cr>

""" leader mappings
let mapleader = ","
noremap <leader>w :w<CR>
noremap <leader>q :q<CR>
noremap <leader>x :wq<CR>
noremap <leader>t :NERDTreeToggle<CR>
noremap <leader>r :so %<CR>
noremap <leader>s :set spell!<CR>

noremap <leader>ov :tabedit ~/.vimrc<CR>


" Plugin configs

"" CtrlP
set wildignore+=*/tmp/*,*.so,*.swp,*.zip,*/node_modules/*

"" Lightline
set laststatus=2


