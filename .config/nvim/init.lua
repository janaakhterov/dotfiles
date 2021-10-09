vim.g.mapleader = " "
vim.g.auto_save = false
vim.g.autofmt_autosave = false

vim.cmd([[
syntax on
syntax sync fromstart
filetype on
filetype indent off
filetype plugin on

setglobal fileencoding=utf-8

colorscheme gruvbox

set noautoindent
set nosmartindent

set autoread
set backspace=indent,eol,start
set cmdheight=2
set display+=lastline
set encoding=utf-8
set expandtab
set hidden
set ignorecase
set incsearch
set laststatus=2
set lazyredraw
set mouse=a
set mousefocus
set nobackup
set noequalalways
set nohlsearch
set noshowmode
set noswapfile
set nowritebackup
set number
set path+=**
set relativenumber
set shiftwidth=4
set shortmess+=c
set shortmess+=c
set signcolumn=yes
set smartcase
set tabstop=4
set termguicolors
set ttyfast
set updatetime=50
set wildmenu
]])

require "plugins.init"
require "mappings"
