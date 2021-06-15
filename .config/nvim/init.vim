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
" Plug 'junegunn/fzf', { 'do': { -> fzf#install() } }
" Plug 'junegunn/fzf.vim'
" Plug 'stsewd/fzf-checkout.vim'

Plug 'nvim-lua/popup.nvim'
Plug 'nvim-lua/plenary.nvim'
Plug 'nvim-telescope/telescope.nvim'
Plug 'ThePrimeagen/harpoon'

Plug 'terryma/vim-multiple-cursors'

" TPOPE!
Plug 'tpope/vim-fugitive'
Plug 'tpope/vim-commentary'
Plug 'tpope/vim-eunuch'
Plug 'tpope/vim-repeat'
Plug 'tpope/vim-surround'
Plug 'tpope/vim-abolish'

" GruuUUVBbboo00X!
" Plug 'tomasr/molokai'
Plug 'morhetz/gruvbox'
Plug 'junegunn/vim-easy-align'
" Plug 'itchyny/lightline.vim'
Plug 'easymotion/vim-easymotion'

" Lang plugins
Plug 'dart-lang/dart-vim-plugin'
Plug 'plasticboy/vim-markdown'
Plug 'LnL7/vim-nix'
Plug 'cstrahan/vim-capnp'
Plug 'leafgarland/typescript-vim'
Plug 'rust-lang/rust.vim'

Plug 'sheerun/vim-polyglot'
Plug 'PProvost/vim-ps1'

Plug 'onsails/lspkind-nvim'
Plug 'kyazdani42/nvim-tree.lua'
Plug 'lukas-reineke/indent-blankline.nvim'
Plug 'glepnir/galaxyline.nvim', {'branch': 'main'}
Plug 'kyazdani42/nvim-web-devicons'

call plug#end()

syntax on
syntax sync fromstart

filetype off
filetype plugin on

colorscheme gruvbox

let mapleader="\<Space>"

let $FZF_DEFAULT_OPTS = '--bind ctrl-a:select-all'
let g:EasyMotion_use_smartsign_us = 1
let g:autofmt_autosave = 1
let g:python3_host_prog = '/usr/bin/python3'
let g:rustfmt_autosave = 1
let g:vim_markdown_folding_disabled = 1
let g:rehash256 = 1
let g:molokai_original = 1
let g:vim_markdown_follow_anchor = 1
let g:lightline = {
      \ 'active': {
      \   'left': [ [ 'mode', 'paste' ],
      \             [ 'gitbranch', 'readonly', 'filename', 'modified' ] ]
      \ },
      \ 'component_function': {
      \   'gitbranch': 'FugitiveHead'
      \ },
  \ }

nnoremap <leader>pf <cmd>Telescope find_files<cr>
nnoremap <leader>pb <cmd>Telescope buffers<cr>
nnoremap <leader>pg <cmd>Telescope git_status<cr>
nnoremap <leader>ps <cmd>Telescope live_grep<cr>
nnoremap <leader>w <C-w>
nnoremap <silent> <leader>pt <cmd>CHADopen<cr>
vnoremap < <gv
vnoremap > >gv
nnoremap <leader>hm <cmd>lua require("harpoon.mark").add_file()<cr>
nnoremap <leader>hu <cmd>lua require("harpoon.ui").toggle_quick_menu()<cr>

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
