set nocompatible            " be iMproved, required
filetype off                " required


" To install plugins call :PluginInstall in vim, 
" or call vim +PluginInstall +qall from command line 
" set the runtime path to include Vundle and initialize
set rtp+=~/.vim/bundle/Vundle.vim
set rtp+=~/.fzf

" Plugins
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
" Plugin 'prettier/vim-prettier'

"" Color schemes
Plugin 'morhetz/gruvbox'

call vundle#end()			" required
filetype plugin indent on   " required

" Vim configs
set nu
filetype plugin indent on
set tabstop=4
set shiftwidth=4
set expandtab
set mouse=a
colorscheme gruvbox

"" Syntax
au BufNewFile,BufRead *.m setlocal ft=emerald

"" Mappings
nnoremap Q @q
vnoremap Q :norm @q<cr>

noremap <C-l> <C-w>l
noremap <C-h> <C-w>h
noremap <C-j> <C-w>j
noremap <C-k> <C-w>k

""" Easier navigation of soft wrapped lines
nnoremap <expr> j v:count ? 'j' : 'gj'
nnoremap <expr> k v:count ? 'k' : 'gk'
nnoremap <expr> <down> v:count ? 'j' : 'gj'
nnoremap <expr> <up> v:count ? 'k' : 'gk'

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

"" Lightline
set laststatus=2

"" Prettier
"" Run prettier before save
let g:prettier#autoformat = 0
autocmd BufWritePre *.js,*.jsx,*.mjs,*.ts,*.tsx,*.css,*.less,*.scss,*.json,*.graphql,*.md,*.vue,*.yaml,*.html PrettierAsync
