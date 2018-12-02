let g:mapleader = "\<Space>"

call plug#begin('~/.vim/plugged')

Plug 'easymotion/vim-easymotion'
  let g:EasyMotion_do_mapping=0
  map <leader>s <Plug>(easymotion-bd-f2)

Plug 'junegunn/fzf', {'dir':'~/.fzf', 'do':'./install --all'}
Plug 'junegunn/fzf.vim'

Plug 'arcticicestudio/nord-vim'
  let g:nord_italic=1
  let g:nord_italic_comments=1
  let g:nord_uniform_status_lines=1
  let g:nord_comment_brightness=15

Plug 'w0rp/ale'
  let g:ale_enabled=1

  let g:ale_fix_on_save=1
  let g:ale_fixers = {
    \ '*': ['remove_trailing_lines', 'trim_whitespace'],
    \ }

  let g:ale_completion_enabled=1
  let g:ale_lint_on_text_changed="normal"
  let g:ale_lint_on_insert_leave=1
  let g:ale_linters = {
    \ 'cpp': ['clang']
    \ }

Plug 'maximbaz/lightline-ale'
Plug 'itchyny/lightline.vim'
  set laststatus=2
  set noshowmode
  let g:lightline = {
    \ 'colorscheme': 'nord',
    \ }
  let g:lightline.component_expand = {
    \  'linter_checking': 'lightline#ale#checking',
    \  'linter_warnings': 'lightline#ale#warnings',
    \  'linter_errors': 'lightline#ale#errors',
    \  'linter_ok': 'lightline#ale#ok',
    \ }
  let g:lightline.component_type = {
    \  'linter_checking': 'left',
    \  'linter_warnings': 'warning',
    \  'linter_errors': 'error',
    \  'linter_ok': 'left',
    \ }
  let g:lightline.active = { 'right': [[ 'linter_checking', 'linter_errors', 'linter_warnings']] }

Plug 'Shougo/deoplete.nvim', { 'do': ':UpdateRemotePlugins' }
  let g:deoplete#enable_at_startup=1
  " Tab completion
  function! s:check_back_space() abort "{{{
  let col = col('.') - 1
    return !col || getline('.')[col - 1]  =~ '\s'
  endfunction"}}}
  inoremap <silent><expr> <TAB>
    \ pumvisible() ? "\<C-n>" :
    \ <SID>check_back_space() ? "\<TAB>" :
    \ deoplete#manual_complete()
  " Close the documentation window when completion is done
  autocmd InsertLeave,CompleteDone * if pumvisible() == 0 | pclose | endif

Plug 'Shougo/deoplete-clangx'

Plug 'scrooloose/nerdtree'
  noremap <leader>\ :NERDTree<CR>

Plug 'majutsushi/tagbar'
  noremap <leader>/ :TagbarToggle<CR>

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

colorscheme nord

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

" Toggle invisible characters
set list listchars=trail:¬∑,tab:‚îä\ ,extends:>,precedes:<,nbsp:¬∑

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
set tabstop=2
set softtabstop=2
set shiftwidth=2
set shiftround
set smarttab

set autoindent
set nosmartindent
set cindent
set cinoptions=l1
set cino=N-s

set ruler
set colorcolumn=80
set linebreak
set textwidth=80

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

map ; :

" break long lines
map j gj
map k gk
map ^ g^
map $ g$
map 0 ^

set pastetoggle=<C-b>

" disable highlight
map <silent> <leader><cr> :noh<cr>

map <C-j> <C-W>j
map <C-k> <C-W>k
map <C-h> <C-W>h
map <C-l> <C-W>l

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Spell check
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

map <leader>ss :setlocal spell!<cr>
set spelllang=ro,en_us

map <leader>sn ]s
map <leader>sp [s
map <leader>sa zg
map <leader>s? z=

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Buffers
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

map <leader>l :bnext<CR>
map <leader>h :bprevious<CR>
map <leader>d :bdelete<cr>

map <leader>te :tabedit <c-r>=expand("%:p:h")<cr>/
map <leader>cd :cd %:p:h<cr>:pwd<cr>

set switchbuf=useopen,usetab,newtab
set showtabline=2

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Searching
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

nmap <C-p> :Files<cr>

let g:fzf_layout = { 'down': '~20%' }

let g:rg_command = '
  \ rg --column --line-number --no-heading --fixed-strings --ignore-case --no-ignore --hidden --follow --color "always"
  \ -g "*.{ts,js,json,php,md,styl,pug,jade,html,config,py,cpp,c,go,hs,rb,conf,fa,lst}"
  \ -g "!{.config,.git,node_modules,vendor,build,yarn.lock,*.sty,*.bst,*.coffee,dist}/*" '

command! -bang -nargs=* F call fzf#vim#grep(g:rg_command .shellescape(<q-args>), 0, <bang>0)
