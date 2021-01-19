silent! call plug#begin('~/.config/nvim/plugged')

" Neovim lsp Plugins
Plug 'neovim/nvim-lspconfig'
Plug 'nvim-lua/completion-nvim'
Plug 'tjdevries/nlua.nvim'
Plug 'tjdevries/lsp_extensions.nvim'

" Neovim Tree shitter
Plug 'nvim-treesitter/nvim-treesitter', {'do': ':TSUpdate'}
Plug 'nvim-treesitter/playground'

" FzzzzzzzzzzzzzZzzffffFff
Plug 'junegunn/fzf', { 'do': { -> fzf#install() } }
Plug 'junegunn/fzf.vim'
Plug 'stsewd/fzf-checkout.vim'

Plug 'terryma/vim-multiple-cursors'

" TPOPE!
Plug 'tpope/vim-fugitive'
Plug 'tpope/vim-commentary'
Plug 'tpope/vim-eunuch'
Plug 'tpope/vim-repeat'
Plug 'tpope/vim-surround'
Plug 'tpope/vim-abolish'

" GruuUUVBbboo00X!
Plug 'morhetz/gruvbox'
Plug 'ms-jpq/chadtree', {'branch': 'chad', 'do': ':UpdateRemotePlugins'}
Plug 'junegunn/vim-easy-align'
Plug 'itchyny/lightline.vim'
Plug 'easymotion/vim-easymotion'

" Lang plugins
Plug 'dart-lang/dart-vim-plugin'
Plug 'plasticboy/vim-markdown'
Plug 'LnL7/vim-nix'
Plug 'cstrahan/vim-capnp'
Plug 'leafgarland/typescript-vim'
Plug 'rust-lang/rust.vim'

Plug 'sheerun/vim-polyglot'

call plug#end()

function! s:build_quickfix_list(lines)
  call setqflist(map(copy(a:lines), '{ "filename": v:val }'))
  copen
  cc
endfunction

syntax on
syntax sync fromstart

filetype off
filetype plugin on

colorscheme gruvbox

let mapleader="\<Space>"

let $FZF_DEFAULT_OPTS = '--bind ctrl-a:select-all'
let g:EasyMotion_use_smartsign_us = 1
let g:autofmt_autosave = 1
let g:fzf_action = {
  \ 'ctrl-q': function('s:build_quickfix_list'),
  \ 'ctrl-t': 'tab split',
  \ 'ctrl-x': 'split',
  \ 'ctrl-v': 'vsplit' }
let g:python3_host_prog = '/usr/bin/python3'
let g:rustfmt_autosave = 1
let g:vim_markdown_folding_disabled = 1
let g:rehash256 = 1
let g:molokai_original = 1

nnoremap <leader>pf :Buffers<CR>
nnoremap <leader>w <C-w>
nnoremap <silent> <leader>pt <cmd>CHADopen<cr>
vnoremap < <gv
vnoremap > >gv

xmap ga <Plug>(EasyAlign)
map <Leader> <Plug>(easymotion-prefix)

autocmd BufRead,BufNewFile *.conf :silent! set filetype=dosini
autocmd FileType * setlocal formatoptions-=c formatoptions-=r formatoptions-=o
autocmd FileType c setlocal commentstring=//\ %s
autocmd FileType cfg setlocal commentstring=#\ %s
autocmd FileType dosini setlocal commentstring=;\ %s
autocmd FileType py setlocal commentstring=#\ %s
autocmd FileType sql setlocal commentstring=--\ %s
autocmd FileType swift setlocal commentstring=//\ %s
autocmd FileType vim setlocal commentstring=\"\ %s
autocmd FileType vue setlocal commentstring=/*\ %s\ */
