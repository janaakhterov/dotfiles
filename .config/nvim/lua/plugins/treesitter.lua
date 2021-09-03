local M = {}

M.config = function()
    require"nvim-treesitter.configs".setup {
         indent = {
           enable = true
         },
        ensure_installed = {
            "html", "css", "bash", "lua", "json", "python", "rust", "go"
        },
        highlight = { enable = true, use_languagetree = true }
    }
end

return M
