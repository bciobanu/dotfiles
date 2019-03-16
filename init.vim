let g:mapleader = "\<Space>"

call plug#begin('~/.vim/plugged')

Plug 'junegunn/fzf', {'dir':'~/.fzf', 'do':'./install --all'}
Plug 'junegunn/fzf.vim'
  nnoremap <leader>; : Buffers<CR>
  nnoremap <leader>f : Files<CR>
  nnoremap T         : Tags<CR>
  nnoremap t         : BTags<CR>
  nnoremap <leader>s : Lines<CR>
  nnoremap <leader>S : Rg<CR>
  let g:fzf_layout = { 'down': '~20%' }
  let g:rg_command = '
    \ rg --column --line-number --no-heading --fixed-strings --ignore-case --no-ignore --hidden --follow --color "always"
    \ -g "*.{ts,js,json,php,md,styl,pug,jade,html,config,py,cpp,c,go,hs,rb,conf,fa,lst}"
    \ -g "!{.config,.git,node_modules,vendor,build,yarn.lock,*.sty,*.bst,*.coffee,dist}/*" '
  command! -bang -nargs=* F call fzf#vim#grep(g:rg_command .shellescape(<q-args>), 0, <bang>0)

Plug 'junegunn/goyo.vim'

Plug 'easymotion/vim-easymotion'
  let g:EasyMotion_do_mapping=0
  map s <Plug>(easymotion-bd-f2)

Plug 'morhetz/gruvbox'

Plug 'rust-lang/rust.vim'

" Autocompletion
Plug 'autozimu/LanguageClient-neovim', {
  \ 'branch': 'next',
  \ 'do': 'bash install.sh',
  \ }
  let g:LanguageClient_autoStart         = 1
  let g:LanguageClient_hasSnippetSupport = 0
  let g:LanguageClient_serverCommands = {
    \ 'rust': ['~/.cargo/bin/rustup', 'run', 'stable', 'rls'],
    \ 'cpp': ['clangd'],
    \ }

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

Plug 'Shougo/neosnippet.vim'
Plug 'Shougo/neosnippet-snippets'
  imap <C-k> <Plug>(neosnippet_expand_or_jump)
  smap <C-k> <Plug>(neosnippet_expand_or_jump)
  xmap <C-k> <Plug>(neosnippet_expand_target)
  if has('conceal')
    set conceallevel=2 concealcursor=niv
  endif

Plug 'scrooloose/nerdtree'
  let g:NERDTreeWinPos              = 'left'
  let g:NERDTreeWinSize             = 20
  let g:NERDTreeStatusline          = "  "
  let g:NERDTreeDirArrowExpandable  = '+'
  let g:NERDTreeDirArrowCollapsible = '-'
  noremap <leader>\ :NERDTree<CR>

Plug 'majutsushi/tagbar'
  noremap <leader>/ :TagbarToggle<CR>

Plug 'godlygeek/tabular'
  function! GetTabber()
    let c = nr2char(getchar())
    :execute "Tabularize /" . c
  endfunction
  nnoremap <Leader>t :call GetTabber()<CR>

Plug 'itchyny/lightline.vim'
  set laststatus=2
  set noshowmode
  let g:lightline = {
    \ 'colorscheme': 'gruvbox',
    \ }

Plug 'tpope/vim-commentary'
Plug 'tpope/vim-fugitive'

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
colorscheme gruvbox

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
set list
set listchars=tab:┊\ ,nbsp:␣,trail:∙,extends:>,precedes:<
set fillchars=vert:\│

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

" break long lines
noremap j gj
noremap k gk
noremap ^ g^
noremap $ g$
noremap 0 ^

" disable highlight
map <silent> <leader><cr> :noh<cr>

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

function! DeleteTrailingWS()
  exe "normal mz"
  %s/\s\+$//ge
  exe "normal `z"
endfunction

autocmd BufWritePre * :call DeleteTrailingWS()
