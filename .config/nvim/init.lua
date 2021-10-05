vim.g.mapleader = " "
vim.g.auto_save = false
vim.g.autofmt_autosave = false

vim.cmd([[
let g:coq_settings = { 'auto_start': v:true }

syntax on
filetype on
filetype indent off
filetype plugin on

setglobal fileencoding=utf-8

colorscheme gruvbox

set noautoindent
set nosmartindent

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

require("plugins.init")
-- require("mappings")

local options = { noremap = true }

vim.api.nvim_set_keymap("n", "<leader>g", [[<Cmd> lua require('telescope.builtin').git_status(require('telescope.themes').get_dropdown())<CR>]], options)
vim.api.nvim_set_keymap("n", "<leader>o", [[<Cmd> lua require('telescope.builtin').find_files(require('telescope.themes').get_dropdown())<CR>]], options)
vim.api.nvim_set_keymap("n", "<leader>p", [[<Cmd> lua require('telescope.builtin').oldfiles(require('telescope.themes').get_dropdown())<CR>]], options)
vim.api.nvim_set_keymap("n", "<leader>s", [[<Cmd> lua require('telescope.builtin').live_grep(require('telescope.themes').get_dropdown())<CR>]], options)
vim.api.nvim_set_keymap("n", "<leader>b", [[<Cmd> lua require('telescope.builtin').buffers(require('telescope.themes').get_dropdown())<CR>]], options)
vim.api.nvim_set_keymap("n", "<leader>c", [[<Cmd> lua require('telescope.builtin').find_files(require('telescope.themes').get_dropdown({ search_dirs = {'$HOME/.config'}}))<CR>]], options)
vim.api.nvim_set_keymap("n", "<leader>a", [[<Cmd> lua require('telescope.builtin').lsp_code_actions(require('telescope.themes').get_dropdown())<CR>]], options)
vim.api.nvim_set_keymap("n", "<leader>r", [[<Cmd> lua require('telescope.builtin').lsp_references(require('telescope.themes').get_dropdown())<CR>]], options)
vim.api.nvim_set_keymap("n", "<leader>t", [[<Cmd> CHADopen<CR>]], options)
