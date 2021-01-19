setglobal fileencoding=utf-8

set autoindent
set autoread
set backspace=indent,eol,start
set cursorline
set display+=lastline
set encoding=utf-8
set expandtab
set hidden
set ignorecase
set incsearch
set laststatus=2
set mouse=a
set mousefocus
set nobackup
set noswapfile
set noequalalways
set nohlsearch
set noshowmode
set nowritebackup
set relativenumber
set number
set path+=**
set rtp+=~/.fzf
set shiftwidth=4
set shortmess+=c
set signcolumn=yes
set smartcase
set tabstop=4
set ttyfast
set wildmenu
set guifont=Hack\ Nerd\ Font:h16
set termguicolors

" Give more space for displaying messages.
set cmdheight=2

" Having longer updatetime (default is 4000 ms = 4 s) leads to noticeable
" delays and poor user experience.
set updatetime=50

" Don't pass messages to |ins-completion-menu|.
set shortmess+=c
