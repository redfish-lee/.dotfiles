syntax on
syntax enable
set background=dark	
set enc=utf8

set nobackup

set wrap            "wrap up
set linebreak       "wrap up when line break
set noswapfile
set noeb	    "no sound 

set title
set showcmd         "always show the status line
set laststatus=2
set cursorline
set hlsearch 	    "highlight search
set number	    "display number
set ruler
"set relativenumber

set nocompatible
set autoindent      "auto indent
set expandtab       "tab to space 
set smarttab
set softtabstop=4		
set shiftwidth=4	

set showmatch       "show match brackets
set backspace=2     "backspace enable deletion

set cindent         "good for c/c++ indent

"auto fill brackets and left shift one char
inoremap ( ()<LEFT>
inoremap [ []<LEFT>
inoremap { {}<LEFT>
inoremap " ""<LEFT>
""inoremap ' ''<LEFT>

"jump to last edited
if has("autocmd")
    au BufReadPost * if line("'\"") > 1 && line("'\"") <= line("$") | exe "normal! g'\"" | endif
endif

let g:airline_powerline_fonts = 1
set guifont=Droid_Sans_Mono_for_Powerline:h12

if !exists('g:airline_symbols')
    let g:airline_symbols = {}
endif

" unicode symbols
let g:airline_left_sep = '»'
let g:airline_right_sep = '«'
let g:airline_symbols.crypt = '🔒'
let g:airline_symbols.linenr = '␤'
let g:airline_symbols.branch = '⎇'
let g:airline_symbols.paste = 'ρ'
let g:airline_symbols.whitespace = 'Ξ'

"Plugins Management
filetype off
set rtp+=~/.vim/bundle/vundle
call vundle#rc()
Plugin 'gmarik/vundle'

Plugin 'bling/vim-airline'
Plugin 'tpope/vim-fugitive'
Plugin 'Mizuchi/STL-syntax'


filetype indent plugin on
