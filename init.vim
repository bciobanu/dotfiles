let g:mapleader = "\<Space>"

call plug#begin('~/.vim/plugged')

Plug 'rust-lang/rust.vim'
Plug 'octol/vim-cpp-enhanced-highlight'
Plug 'tpope/vim-commentary'
Plug 'junegunn/seoul256.vim'

call plug#end()

filetype plugin indent on
syntax on

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Theme
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

if !has('gui_running')
  set t_Co=256
endif

if has('termguicolors')
  set termguicolors
endif

set background=dark
colorscheme seoul256

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" General
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

set wildmenu
set wildmode=longest:full,full
set invnumber
set wrap
set noendofline binary
set number
set relativenumber
set autoread
set cmdheight=2
set showcmd
set cursorline

set encoding=utf8
set fileformats=unix,dos,mac

set clipboard+=unnamed

" Toggle invisible characters
"set list
"set listchars=tab:‚îä\ ,nbsp:‚ê£,trail:‚àô,extends:>,precedes:<
"set fillchars=vert:\‚îÇ

" Discard error bells
set noerrorbells
set belloff=all

" Fix backspace
set backspace=indent,eol,start
set whichwrap+=<,>,h,l

" Performance options
set lazyredraw
set ttyfast
set synmaxcol=200

" Turn off backups
set nobackup
set nowritebackup
set noswapfile

" Tabs/window
set mouse=a
set splitbelow
set splitright

" Indenting
set expandtab
set tabstop=4
set softtabstop=4
set shiftwidth=4
set shiftround
set smarttab

set autoindent
set nosmartindent
set cindent
set cinoptions=l1
set cino=N-s

set ruler
set colorcolumn=81
set linebreak

set scrolloff=7

" Search
set hlsearch
set incsearch
set inccommand=split
set magic
set ignorecase

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Key mappings
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

set timeoutlen=500
set ttimeoutlen=50

" jk acts as ESC
imap jk <ESC>
imap kj <ESC>

noremap ; :

" Break long lines
noremap j gj
noremap k gk
noremap ^ g^
noremap $ g$
noremap 0 ^

" Disable highlight
map <silent> <leader><cr> :noh<cr>

" Upon writing remove trailing whitespaces
function! DeleteTrailingWS()
  exe "normal mz"
  %s/\s\+$//ge
  exe "normal `z"
endfunction

autocmd BufWritePre * :call DeleteTrailingWS()

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Buffers
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

nnoremap <leader>b :bnext<CR>
nnoremap <leader>B :bprevious<CR>
nnoremap <leader>d :bdelete<cr>

map <C-j> <C-W>j
map <C-k> <C-W>k
map <C-h> <C-W>h
map <C-l> <C-W>l

set switchbuf=useopen,usetab,newtab
set showtabline=2
