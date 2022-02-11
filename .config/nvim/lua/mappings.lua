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
vim.api.nvim_set_keymap("n", "<leader>y", [[<Cmd> SidebarNvimToggle<CR>]], options)
