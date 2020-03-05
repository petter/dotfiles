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

Plugin 'junegunn/fzf.vim'
Plugin 'tpope/vim-commentary'
Plugin 'itchyny/lightline.vim'
Plugin 'terryma/vim-multiple-cursors'
Plugin 'tpope/vim-eunuch'
Plugin 'tpope/vim-surround'
Plugin 'scrooloose/nerdtree'
Plugin 'pettersmoen/emmet-vim'
Plugin 'w0rp/ale'
Plugin 'Valloric/YouCompleteMe'
Plugin 'airblade/vim-gitgutter'
Plugin 'christoomey/vim-tmux-navigator'
Plugin 'junegunn/goyo.vim'
" Plugin 'prettier/vim-prettier'

"" Color schemes
Plugin 'morhetz/gruvbox'
Plugin 'tomasr/molokai'

call vundle#end()			" required
filetype plugin indent on   " required

" Vim configs
set nu
set rnu
filetype plugin indent on
set tabstop=4
set shiftwidth=4
set expandtab
set mouse=a
colorscheme molokai

"" Syntax
au BufNewFile,BufRead *.m setlocal ft=emerald

"" Mappings
nnoremap Q @q
vnoremap Q :norm @q<cr>

" noremap <C-l> <C-w>l
" noremap <C-h> <C-w>h
" noremap <C-j> <C-w>j
" noremap <C-k> <C-w>k

""" Easier navigation of soft wrapped lines
nnoremap <expr> j v:count ? 'j' : 'gj'
nnoremap <expr> k v:count ? 'k' : 'gk'
nnoremap <expr> <down> v:count ? 'j' : 'gj'
nnoremap <expr> <up> v:count ? 'k' : 'gk'

noremap <C-x> :FZF<cr>
nnoremap Y y$

""" leader mappings
let mapleader = ","
nnoremap <leader>w :w<CR>
nnoremap <leader>q :q<CR>
nnoremap <leader>Q :q!<CR>
nnoremap <leader>x :wq<CR>
nnoremap <leader>r :so ~/.config/nvim/init.vim<CR>
noremap <leader>: :Commands<CR>

"""" Toggles
nnoremap <leader>tt :NERDTreeToggle<CR>
nnoremap <leader>tg :Goyo<CR>

"""" Spelling
nnoremap <leader>ss :set spell!<CR>
nnoremap <leader>sn :set spelllang=nb<CR>
nnoremap <leader>sn :set spelllang=en<CR>

"""" Open
nnoremap <leader>ov :tabedit ~/.vimrc<CR>
nnoremap <leader>oi :tabedit ~/.config/nvim/init.vim<CR>
nnoremap <leader>ot :tabedit ~/.tmux.conf<CR>

" Plugin configs

"" Lightline
set laststatus=2

"" Prettier
"" Run prettier before save
" let g:prettier#autoformat = 0
" autocmd BufWritePre *.js,*.jsx,*.mjs,*.ts,*.tsx,*.css,*.less,*.scss,*.json,*.graphql,*.md,*.vue,*.yaml,*.html PrettierAsync
