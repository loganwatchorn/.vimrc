"65""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"70"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"75""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

" Plugins
call plug#begin('~/.vim/plugged')
  " Theme
  Plug 'sonph/onehalf', { 'rtp': 'vim' }

  " Code support
  Plug 'vim-python/python-syntax'
  Plug 'rust-lang/rust.vim'
  Plug 'vim-syntastic/syntastic' "syntax checker

  " Text manipulation
  Plug 'Raimondi/delimitMate'
  Plug 'AndrewRadev/splitjoin.vim'
  Plug 'tpope/vim-commentary'
  Plug 'tpope/vim-speeddating'
  Plug 'tpope/vim-surround'

  " Git support
  Plug 'tpope/vim-fugitive' "git commands
  Plug 'airblade/vim-gitgutter'

  " OS
  Plug 'preservim/nerdtree' "file browser
  Plug 'tpope/vim-eunuch' "unix commands
  Plug 'karoliskoncevicius/vim-sendtowindow'
call plug#end()

" Appearance
if strftime("%H") < $DAY_START || $DAY_END < strftime("%H")
  colorscheme onehalfdark
else
  colorscheme onehalflight
endif

set number "line numbering on
set cursorline "cursor line highlighted
set colorcolumn=81
let g:python_highlight_all=1

" Behaviour
set scrolloff=25 "keep 25 lines below and above cursor

" Languages
syntax enable
filetype plugin indent on "language syntax highlights

" Indentation
set tabstop=2 "tabs are 2 spaces wide
set expandtab "tabs are spaces
set shiftwidth=2 "indents are 2 spaces wide

" NERDTree file browser
nnoremap <leader>f :NERDTreeToggle<CR> 
let NERDTreeShowBookmarks=1
let NERDTreeIgnore=['\.pyc$']

" Text editing
let delimitMate_expand_space=1
let delimitMate_expand_cr=1


" REVL
nnoremap <C-S> :w \| :call term_sendkeys(2, "cargo run\r")<CR>
inoremap <C-S> <Esc>:w \| :call term_sendkeys(2, "cargo run\r")<CR>
vnoremap <C-S> <Esc>:w \| :call term_sendkeys(2, "cargo run\r")<CR>

" Terminal
set splitbelow
nnoremap <leader>t :term<CR><C-W>j<C-W>N:res 11<CR>i<C-W>k
tnoremap <leader>t <C-W>N:q!<CR>
