let g:mapleader = "\<Space>"

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
set winblend=100
set inccommand=nosplit

function! SetupSolarized()
    set termguicolors
    colorscheme solarized8_high
endfunction

function! SetupEasymotion()
    let g:EasyMotion_do_mapping=0
    nmap s <Plug>(easymotion-bd-f2)
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

call SetupSolarized()
call SetupEasymotion()
call SetupFZF()
