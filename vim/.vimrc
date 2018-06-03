syntax on
syntax enable
set background=dark	
set enc=utf8

set nobackup
set wrap            "wrap up
set linebreak       "wrap up when line break
set noswapfile

set title
set showcmd         "always show the status line
set laststatus=2
set cursorline
set hlsearch 	    "highlight search
set ruler

set nocompatible
set autoindent      "auto indent
set expandtab       "tab to space 
set smarttab
set softtabstop=4		
set shiftwidth=4	

set colorcolumn=80
set showmatch       "show match brackets

set cindent         "good for c/c++ indent

filetype plugin on
filetype plugin indent on
autocmd FileType python setlocal shiftwidth=4 tabstop=4


"auto fill brackets and left shift one char
"inoremap ( ()<LEFT>
"inoremap [ []<LEFT>
"inoremap { {}<LEFT>
"inoremap " ""<LEFT>
"inoremap ' ''<LEFT>
"inoremap /. /*  */<LEFT><LEFT>

"set pastetoggle=<F12>

"jump to last edited

if has("autocmd")
    au BufReadPost * if line("'\"") > 1 && line("'\"") <= line("$") | exe "normal! g'\"" | endif
endif

"Plugins Management
set nocompatible
filetype off

set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()
Plugin 'VundleVim/Vundle.vim'

Plugin 'tpope/vim-fugitive'
Plugin 'Mizuchi/STL-syntax'
Plugin 'Vimjas/vim-python-pep8-indent'


" All of your Plugins must be added before the following line
call vundle#end()            " required
filetype plugin indent on    " required
