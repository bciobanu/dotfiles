let g:mapleader = "\<Space>"

call plug#begin(stdpath('data') . '/plugged')

Plug 'tpope/vim-sensible'
Plug 'tpope/vim-surround'
Plug 'tpope/vim-commentary'
Plug 'tpope/vim-unimpaired'
Plug 'tpope/vim-repeat'

Plug 'chaoren/vim-wordmotion'
Plug 'justinmk/vim-sneak'
Plug 'tommcdo/vim-lion'
Plug 'junegunn/fzf.vim'

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

function! SetupTheme()
    set termguicolors
    colorscheme solarized8
endfunction

function! SetupSneak()
    let g:sneak#label = 1
endfunction

function! SetupFZF()
    set rtp+=/usr/local/opt/fzf
    let g:rg_command = 'rg --column --line-number --no-heading --fixed-strings --ignore-case --no-ignore --hidden --follow --color "always"'
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

call SetupTheme()
call SetupSneak()
call SetupFZF()
