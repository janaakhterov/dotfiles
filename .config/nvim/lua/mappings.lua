-- vim.api.nvim_set_keyvim.api.nvim_set_keymap("n", "<leader>/", ":CommentToggle<CR>", opt)
-- vim.api.nvim_set_keyvim.api.nvim_set_keymap("v", "<leader>/", ":CommentToggle<CR>", opt)
-- 
-- local check_back_space = function()
--     local col = vim.fn.col(".") - 1
--     if col == 0 or vim.fn.getline("."):sub(col, col):match("%s") then
--         return true
--     else
--         return false
--     end
-- end
-- 
-- _G.tab_complete = function()
--     if vim.fn.pumvisible() == 1 then
--         return vim.api.nvim_replace_termcodes("<C-n>", true, true, true)
--     elseif check_back_space() then
--         return vim.api.nvim_replace_termcodes("<Tab>", true, true, true)
--     else
--         return vim.fn["compe#complete"]()
--     end
-- end
-- 
-- _G.s_tab_complete = function()
--     if vim.fn.pumvisible() == 1 then
--         return vim.api.nvim_replace_termcodes("<C-p>", true, true, true)
--     elseif vim.fn.call("vsnip#jumpable", {-1}) == 1 then
--         return vim.api.nvim_replace_termcodes("<Plug>(vsnip-jump-prev)", true, true, true)
--     else
--         return vim.api.nvim_replace_termcodes("<S-Tab>", true, true, true)
--     end
-- end
-- 
-- function _G.completions()
--     local npairs = require("nvim-autopairs")
--     if vim.fn.pumvisible() == 1 then
--         if vim.fn.complete_info()["selected"] ~= -1 then
--             return vim.fn["compe#confirm"]("<CR>")
--         end
--     end
--     return npairs.check_break_line_char()
-- end
--  compe mappings
-- vim.api.nvim_set_keymap("i", "<Tab>", "v:lua.tab_complete()", {expr = true})
-- vim.api.nvim_set_keymap("s", "<Tab>", "v:lua.tab_complete()", {expr = true})
-- vim.api.nvim_set_keymap("i", "<S-Tab>", "v:lua.s_tab_complete()", {expr = true})
-- vim.api.nvim_set_keymap("s", "<S-Tab>", "v:lua.s_tab_complete()", {expr = true})
-- vim.api.nvim_set_keymap("i", "<CR>", "v:lua.completions()", {expr = true})
-- nvimtree
-- vim.api.nvim_set_keymap("n", "<C-n>", ":NvimTreeToggle<CR>", opt)
-- Telescope
vim.api.nvim_set_keymap("n", "<Leader>gs", [[ <Cmd> Telescope git_status <CR> ]], {})
vim.api.nvim_set_keymap("n", "<Leader>gc", [[ <Cmd> Telescope git_commits <CR> ]], {})
vim.api.nvim_set_keymap("n", "<Leader>pf", [[ <Cmd> Telescope find_files <CR> ]], {})
vim.api.nvim_set_keymap("n", "<Leader>ps", [[ <Cmd> Telescope live_grep <CR> ]], {})
vim.api.nvim_set_keymap("n", "<Leader>pb", [[ <Cmd> Telescope buffers <CR> ]], {})
vim.api.nvim_set_keymap("n", "<Leader>sh", [[ <Cmd> Telescope find_files({ search_dirs = {'$HOME/.config/hedera'} }) <CR> ]], {})

-- bufferline tab stuff
-- vim.api.nvim_set_keymap("n", "<S-t>", ":tabnew<CR>", opt) -- new tab
-- vim.api.nvim_set_keymap("n", "<S-x>", ":bd!<CR>", opt) -- close tab

-- move between tabs
-- vim.api.nvim_set_keymap("n", "<TAB>", [[<Cmd>BufferLineCycleNext<CR>]], opt)
-- vim.api.nvim_set_keymap("n", "<S-TAB>", [[<Cmd>BufferLineCyclePrev<CR>]], opt)
