vim.g.coq_settings = { auto_start = true }

vim.g.mapleader = " "
vim.g.auto_save = false
vim.g.autofmt_autosave = false

vim.o.autoindent = false
vim.o.autoread = true
vim.o.backspace = "indent,eol,start"
vim.o.backup = false
vim.o.cmdheight = 2
vim.o.encoding = "utf-8"
vim.o.equalalways = false
vim.o.expandtab = true
vim.o.hidden = true
vim.o.hlsearch = false
vim.o.ignorecase = true
vim.o.incsearch = true
vim.o.laststatus = 2
vim.o.lazyredraw = true
vim.o.mouse = "a"
vim.o.mousefocus = true
vim.o.number = true
vim.o.relativenumber = true
vim.o.shiftwidth = 4
vim.o.showmode = false
vim.o.signcolumn = "yes"
vim.o.smartcase = true
vim.o.smartindent = false
vim.o.swapfile = false
vim.o.termguicolors = true
vim.o.ttyfast = true
vim.o.updatetime = 50
vim.o.wildmenu = true
vim.o.writebackup = false
vim.opt.display = vim.opt.display + "lastline"
vim.opt.path = vim.opt.path + ",**"
vim.opt.shortmess = vim.opt.shortmess + { c = true }
vim.o.bg = "light"

vim.go.fileencoding = "utf-8"

require "plugins.init"
require "mappings"

vim.cmd([[
syntax on
syntax sync fromstart
filetype on
filetype indent off
filetype plugin on

colorscheme gruvbox

autocmd! BufRead,BufNewFile *.ics setfiletype icalendar
]])
