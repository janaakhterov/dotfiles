set runtimepath^=~/.vim runtimepath+=~/.vim/after
let &packpath = &runtimepath
source ~/.vim/vimrc

nnoremap <silent> <leader>s :te<CR>
nnoremap <silent> <leader>vs :source $HOME/.config/nvim/init.vim<CR>
nnoremap <silent> <leader>ve :vs $HOME/.config/nvim/init.vim<CR>
