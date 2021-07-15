vim.cmd([[
syntax on
syntax sync fromstart

filetype off
filetype plugin on

setglobal fileencoding=utf-8

colorscheme gruvbox

set autoindent
set autoread
set backspace=indent,eol,start
set display+=lastline
set encoding=utf-8
set expandtab
set guifont=Hack\ Nerd\ Font:h16
set hidden
set ignorecase
set incsearch
set laststatus=2
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
set rtp+=~/.fzf
set shiftwidth=4
set shortmess+=c
set signcolumn=yes
set smartcase
set tabstop=4
set termguicolors
set ttyfast
set lazyredraw
set wildmenu
set cmdheight=2
set updatetime=50
set shortmess+=c
]])

vim.g.mapleader = " "
vim.g.auto_save = false
vim.g.autofmt_autosave = false

require "plugins.init"
require "mappings"
