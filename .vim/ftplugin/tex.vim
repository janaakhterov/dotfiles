" Highlight columns past 58
" execute "set colorcolumn=" . join(range(58, 120), ',')

" Spell check enabled
setlocal spell

" Set updatetime for vim to automatically write to swap after 1000ms instead
" of default 4000ms
set updatetime=1000

" Set tab width and shiftwidth to 2 spaces instead of 4
set tabstop=2
set shiftwidth=2

nnoremap <leader>pf :!pdflatex %<CR>
nnoremap <leader>jf :!bibtex %:r<CR>
nnoremap <silent> <leader>ff :LLPStartPreview<CR>

" Changing movement keys to move by visual lines
nnoremap j gj
nnoremap k gk
nnoremap 0 g0
nnoremap $ g$

" Removing Line Numbers
set nonumber
set norelativenumber
