" Install vim-plug if not found
if empty(glob('~/.vim/autoload/plug.vim'))
  silent !curl -fLo ~/.vim/autoload/plug.vim --create-dirs
    \ https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
endif

set rtp+=~/.fzf

" Plugins
call plug#begin('~/.vim/plugged')

Plug 'junegunn/vim-plug'

Plug 'neoclide/coc.nvim', {'branch': 'release'}
Plug 'junegunn/fzf', { 'do': { -> fzf#install() } }
Plug 'junegunn/fzf.vim'
Plug 'tpope/vim-commentary'
Plug 'itchyny/lightline.vim'
Plug 'terryma/vim-multiple-cursors'
Plug 'tpope/vim-eunuch'
Plug 'tpope/vim-surround'
Plug 'scrooloose/nerdtree'
Plug 'pettersmoen/emmet-vim'
Plug 'w0rp/ale'
Plug 'christoomey/vim-tmux-navigator'
Plug 'junegunn/goyo.vim'
Plug 'lervag/vimtex'
Plug 'chaoren/vim-wordmotion'
Plug 'SirVer/ultisnips'
Plug 'honza/vim-snippets'

"" Color schemes
Plug 'morhetz/gruvbox'
Plug 'tomasr/molokai'

call plug#end()			" required
"
" Run PlugInstall if there are missing plugins
if len(filter(values(g:plugs), '!isdirectory(v:val.dir)'))
  autocmd VimEnter * PlugInstall --sync | source $MYVIMRC
endif

filetype plugin indent on   " required

" Vim configs
set hidden
set nobackup
set nowritebackup
set cmdheight=2
set updatetime=300
set nu
set rnu
filetype plugin indent on
set tabstop=4
set shiftwidth=4
set expandtab
set mouse=a
colorscheme molokai

" Don't pass messages to |ins-completion-menu|.
set shortmess+=c

" Always show the signcolumn, otherwise it would shift the text each time
" diagnostics appear/become resolved.
if has("patch-8.1.1564")
  " Recently vim can merge signcolumn and number column into one
  set signcolumn=number
else
  set signcolumn=yes
endif

" Use tab for trigger completion with characters ahead and navigate.
" NOTE: Use command ':verbose imap <tab>' to make sure tab is not mapped by
" other plugin before putting this into your config.
inoremap <silent><expr> <TAB>
      \ pumvisible() ? "\<C-n>" :
      \ <SID>check_back_space() ? "\<TAB>" :
      \ coc#refresh()
inoremap <expr><S-TAB> pumvisible() ? "\<C-p>" : "\<C-h>"


function! s:check_back_space() abort
  let col = col('.') - 1
  return !col || getline('.')[col - 1]  =~# '\s'
endfunction


"" Syntax
au BufNewFile,BufRead *.m setlocal ft=emerald

"" Mappings
nnoremap Q @q
vnoremap Q :norm @q<cr>

nnoremap <space> /

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

"""" (t)oggles
nnoremap <leader>tt :NERDTreeToggle<CR>
nnoremap <leader>tg :Goyo<CR>

"""" (s)pelling
nnoremap <leader>ss :set spell!<CR>
nnoremap <leader>sn :set spelllang=nb<CR>
nnoremap <leader>sn :set spelllang=en<CR>

"""" (o)pen
nnoremap <leader>oz :edit ~/.zshrc<CR>
nnoremap <leader>ov :edit ~/.vimrc<CR>
nnoremap <leader>oi :edit ~/.config/nvim/init.vim<CR>
nnoremap <leader>ot :edit ~/.tmux.conf<CR>

"""" (l)sp
nmap <silent> <leader>lp <Plug>(coc-diagnostic-prev)
nmap <silent> <leader>ln <Plug>(coc-diagnostic-next)
nmap <silent> <leader>ld <Plug>(coc-definition)
nmap <leader>lr <Plug>(coc-rename)


" Plugin configs

"" Lightline
set laststatus=2
let g:lightline = {
\ 'colorscheme': 'wombat',
\ 'active': {
\   'left': [ [ 'mode', 'paste' ],
\             [ 'cocstatus', 'readonly', 'filename', 'modified' ] ]
\ },
\ 'component_function': {
\   'cocstatus': 'coc#status'
\ },
\ }

" Use auocmd to force lightline update.
autocmd User CocStatusChange,CocDiagnosticChange call lightline#update()

"" vimtex
let g:tex_flavor = 'latex'

"" wordmotion
let g:wordmotion_prefix = '-'

"" Coc
" Make <CR> auto-select the first completion item and notify coc.nvim to
" format on enter, <cr> could be remapped by other vim plugin
inoremap <silent><expr> <cr> pumvisible() ? coc#_select_confirm()
                              \: "\<C-g>u\<CR>\<c-r>=coc#on_enter()\<CR>"

nnoremap <silent> K :call <SID>show_documentation()<CR>

function! s:show_documentation()
  if (index(['vim','help'], &filetype) >= 0)
    execute 'h '.expand('<cword>')
  elseif (coc#rpc#ready())
    call CocActionAsync('doHover')
  else
    execute '!' . &keywordprg . " " . expand('<cword>')
  endif
endfunction

autocmd CursorHold * silent call CocActionAsync('highlight')

" Add `:Format` command to format current buffer.
command! -nargs=0 Format :call CocAction('format')

" Add `:Fold` command to fold current buffer.
command! -nargs=? Fold :call     CocAction('fold', <f-args>)

" Add `:OR` command for organize imports of the current buffer.
command! -nargs=0 OR   :call     CocAction('runCommand', 'editor.action.organizeImport')
