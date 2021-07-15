local M = {}

M.config = function()
    require"nvim-treesitter.configs".setup {
        ensure_installed = {
            "javascript", "html", "css", "bash", "lua", "json", "python", "rust", "go"
        },
        highlight = { enable = true, use_languagetree = true }
    }
end

return M
