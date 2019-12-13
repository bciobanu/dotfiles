let g:mapleader = "\<Space>"

call plug#begin('~/.vim/plugged')

Plug 'tpope/vim-sensible'
Plug 'tpope/vim-surround'
Plug 'tpope/vim-commentary'
Plug 'tpope/vim-unimpaired'

Plug 'neoclide/coc.nvim', {'branch': 'release'}
Plug 'dense-analysis/ale'

Plug 'junegunn/fzf', {'dir':'~/.fzf', 'do':'./install --all'}
Plug 'junegunn/fzf.vim'

Plug 'easymotion/vim-easymotion'
  let g:EasyMotion_do_mapping=0
  nmap s <Plug>(easymotion-bd-f2)

Plug 'lifepillar/vim-solarized8'

call plug#end()

filetype plugin indent on
syntax on

set wrap
set linebreak

set invnumber
set relativenumber

set cmdheight=2
set showcmd

set clipboard+=unnamed
set mouse=a

set autoindent
set tabstop=8
set softtabstop=4
set shiftwidth=4
set expandtab

set cursorline
set ruler
set colorcolumn=81

" transparency for floating windows
set winblend=20
set inccommand=nosplit

noremap ; :
noremap j gj
noremap k gk
noremap ^ g^
noremap $ g$

nnoremap <Tab> <C-I>
nnoremap <Backspace> <C-O>

function! SetupALE()
  let g:ale_enabled = 1
  let g:ale_fix_on_save = 1
  let g:ale_fixers = {
  \ "*": ["remove_trailing_lines", "trim_whitespace"],
  \ "python": ["isort", "black"],
  \ }
  let g:ale_python_flake8_options = "--ignore E203, E266, E501, W503 --max-line-length 90 --complexity 18 --select B,C,E,F,W,T4,B9"
  let g:ale_python_mypy_options = "--ignore-missing-imports"
endfunction

function! SetupCoc()
  set hidden
  set updatetime=300

  inoremap <silent><expr> <TAB>
    \ pumvisible() ? "\<C-n>" :
    \ <SID>check_back_space() ? "\<TAB>" :
    \ coc#refresh()
  inoremap <expr><S-TAB> pumvisible() ? "\<C-p>" : "\<C-h>"

  function! s:check_back_space() abort
    let col = col('.') - 1
    return !col || getline('.')[col - 1]  =~# '\s'
  endfunction
endfunction

function! SetupFZF()
  nnoremap <leader>b : Buffers<CR>
  nnoremap <leader>f : Files<CR>
  nnoremap <leader>s : Lines<CR>
  nnoremap <leader>S : Rg<CR>

  let g:rg_command = '
    \ rg --column --line-number --no-heading --fixed-strings --ignore-case --no-ignore --hidden --follow --color "always"
    \ -g "*.{ts,js,json,php,md,styl,pug,jade,html,config,py,cpp,c,go,hs,rb,conf,fa,lst}"
    \ -g "!{.config,.git,node_modules,vendor,build,yarn.lock,*.sty,*.bst,*.coffee,dist}/*" '
  command! -bang -nargs=* F call fzf#vim#grep(g:rg_command .shellescape(<q-args>), 0, <bang>0)

  let $FZF_DEFAULT_OPTS='--layout=reverse'
  let g:fzf_layout = {'window': 'call FloatingFZF()'}

  function! FloatingFZF()
    let buf = nvim_create_buf(v:false, v:true)
    let height = float2nr(&lines * 0.9)
    let width = float2nr(&columns * 0.6)
    let horizontal = float2nr((&columns - width) / 2)
    let vertical = 1
    let opts = {
    \ "relative": "editor",
    \ "row": vertical,
    \ "col": horizontal,
    \ "width": width,
    \ "height": height
    \ }
    call nvim_open_win(buf, v:true, opts)
  endfunction
endfunction

function! SetTheme()
  let &t_8f = "\<Esc>[38;2;%lu;%lu;%lum"
  let &t_8b = "\<Esc>[48;2;%lu;%lu;%lum"
  set termguicolors
  colorscheme solarized8
endfunction

call SetupALE()
call SetupCoc()
call SetupFZF()
call SetTheme()
