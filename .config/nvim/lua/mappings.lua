local options = { noremap = true }

vim.cmd([[
    noremap q q
    noremap d w
    noremap r e
    noremap w r
    noremap b t
    noremap j y
    noremap f u
    noremap u i
    noremap p o
    noremap ; p
    noremap a a
    noremap s s
    noremap h d
    noremap t f
    noremap g g
    noremap y h
    noremap n j
    noremap e k
    noremap o l
    noremap i ;
    noremap z z
    noremap x x
    noremap m c
    noremap c v
    noremap v b
    noremap k n
    noremap l m
    noremap Q Q
    noremap D W
    noremap R E
    noremap W R
    noremap B T
    noremap J Y
    noremap F U
    noremap U I
    noremap P O
    noremap : P
    noremap A A
    noremap S S
    noremap H D
    noremap T F
    noremap G G
    noremap Y H
    noremap N J
    noremap E K
    noremap O L
    noremap I :
    noremap Z Z
    noremap X X
    noremap M C
    noremap C V
    noremap V B
    noremap K N
    noremap L M 
]])

vim.api.nvim_set_keymap("n", "<leader>g", [[<Cmd> lua require('telescope.builtin').git_status(require('telescope.themes').get_dropdown())<CR>]], options)
vim.api.nvim_set_keymap("n", "<leader>o", [[<Cmd> lua require('telescope.builtin').find_files(require('telescope.themes').get_dropdown())<CR>]], options)
vim.api.nvim_set_keymap("n", "<leader>p", [[<Cmd> lua require('telescope.builtin').oldfiles(require('telescope.themes').get_dropdown())<CR>]], options)
vim.api.nvim_set_keymap("n", "<leader>s", [[<Cmd> lua require('telescope.builtin').live_grep(require('telescope.themes').get_dropdown())<CR>]], options)
vim.api.nvim_set_keymap("n", "<leader>b", [[<Cmd> lua require('telescope.builtin').buffers(require('telescope.themes').get_dropdown())<CR>]], options)
vim.api.nvim_set_keymap("n", "<leader>c", [[<Cmd> lua require('telescope.builtin').find_files(require('telescope.themes').get_dropdown({ search_dirs = {'$HOME/.config'}}))<CR>]], options)
vim.api.nvim_set_keymap("n", "<leader>a", [[<Cmd> lua require('telescope.builtin').lsp_code_actions(require('telescope.themes').get_dropdown())<CR>]], options)
vim.api.nvim_set_keymap("n", "<leader>r", [[<Cmd> lua require('telescope.builtin').lsp_references(require('telescope.themes').get_dropdown())<CR>]], options)
vim.api.nvim_set_keymap("n", "<leader>t", [[<Cmd> CHADopen<CR>]], options)
vim.api.nvim_set_keymap("n", "<leader>y", [[<Cmd> SidebarNvimToggle<CR>]], options)
