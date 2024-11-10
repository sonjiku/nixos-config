set nocompatible

set ttimeoutlen=50
set termguicolors
set background=dark
colorscheme zaibatsu
set relativenumber
set number
syntax enable

"" Indent
set autoindent
set expandtab
"set filetype indent on
set shiftround
set shiftwidth=4
set smarttab
set tabstop=4



"" screen
set lazyredraw
set display+=lastline
set encoding=utf-8
set scrolloff=1
set sidescrolloff=5
set wrap

"" Search
set hlsearch
set ignorecase
set incsearch
set smartcase

"" Status
set ruler
set laststatus=2
set wildmenu
set tabpagemax=50
set noerrorbells
set novisualbell
set mouse=a
set title

"" Folds
set foldmethod=indent
set foldnestmax=3
set nofoldenable

"" Misc
set autoread
set backspace=indent,eol,start
set backupdir=~/.cache/vim
set confirm
set dir=~/.local/state/vim
set formatoptions+=j
set hidden
set history=1000
set nomodeline
set noswapfile
set nrformats-=octal
"set shell
"set spell
set wildignore+=.pyc,.swp

""" Golf useful
"set listchars=tab:>\ ,trail:-,extends:>,precedes:<,nbsp:+,eol:$
"set list

"" Cursor
set cursorcolumn
set cursorline
set cursorlineopt=line
set guicursor=i-c:ver20-blinkwait1-blinkon50-blinkoff50,r:hor20,v:block,n:block-blinkwait1-blinkon50-blinkoff50

hi clear CursorLine
hi link CursorLine CursorColumn
""Ps = 0  -> blinking block.
""Ps = 1  -> blinking block (default).
""Ps = 2  -> steady block.
""Ps = 3  -> blinking underline.
""Ps = 4  -> steady underline.
""Ps = 5  -> blinking bar (xterm).
""Ps = 6  -> steady bar (xterm).
"" Insert, replace, normal
let &t_SI = "\e[5 q"
let &t_SR = "\e[3 q"
let &t_EI = "\e[1 q"
let &t_ti .= "\e[1 q"  " cursor when vim starts
let &t_te .= "\e[2 q"  " cursor when vim exits

" reset the cursor on start (for older versions of vim, usually not required)
"augroup myCmds
"au!
"autocmd VimEnter * silent !echo -ne "\e[1 q"
"augroup END
