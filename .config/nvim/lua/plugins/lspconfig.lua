local M = {}

M.on_attach = function(_, bufnr)
    vim.api.nvim_buf_set_option(bufnr, "omnifunc", "v:lua.vim.lsp.omnifunc")

    local opts = { noremap = true, silent = true }

    vim.api.nvim_buf_set_keymap(bufnr, "n", "gD", "<Cmd>lua vim.lsp.buf.declaration()<CR>", opts)
    vim.api.nvim_buf_set_keymap(bufnr, "n", "gd", "<Cmd>lua vim.lsp.buf.definition()<CR>", opts)
    vim.api.nvim_buf_set_keymap(bufnr, "n", "K", "<Cmd>lua vim.lsp.buf.hover()<CR>", opts)
    vim.api.nvim_buf_set_keymap(bufnr, "n", "gi", "<cmd>lua vim.lsp.buf.implementation()<CR>", opts)
    vim.api.nvim_buf_set_keymap(bufnr, "n", "<C-k>", "<cmd>lua vim.lsp.buf.signature_help()<CR>", opts)
    vim.api.nvim_buf_set_keymap(bufnr, "n", "<leader>D", "<cmd>lua vim.lsp.buf.type_definition()<CR>", opts)
    vim.api.nvim_buf_set_keymap(bufnr, "n", "<leader>rn", "<cmd>lua vim.lsp.buf.rename()<CR>", opts)
    vim.api.nvim_buf_set_keymap(bufnr, "n", "gr", "<cmd>lua vim.lsp.buf.references()<CR>", opts)
    vim.api.nvim_buf_set_keymap(bufnr, "n", "<leader>e", "<cmd>lua vim.lsp.diagnostic.show_line_diagnostics()<CR>", opts)
    vim.api.nvim_buf_set_keymap(bufnr, "n", "[d", "<cmd>lua vim.lsp.diagnostic.goto_prev()<CR>", opts)
    vim.api.nvim_buf_set_keymap(bufnr, "n", "]d", "<cmd>lua vim.lsp.diagnostic.goto_next()<CR>", opts)
    vim.api.nvim_buf_set_keymap(bufnr, "n", "<leader>q", "<cmd>lua vim.lsp.diagnostic.set_loclist()<CR>", opts)
end

M.config = function()
    local capabilities = vim.lsp.protocol.make_client_capabilities()
    capabilities.textDocument.completion.completionItem.snippetSupport = true

    local setup = require"coq".lsp_ensure_capabilities({
        on_attach = M.on_attach,
        capabilities = capabilities,
        root_dir = vim.loop.cwd
    })

    local lspconfig = require"lspconfig"

    lspconfig.tsserver.setup(setup)
    lspconfig.rust_analyzer.setup(setup)
    lspconfig.sourcekit.setup(setup)
    lspconfig.bashls.setup(setup)
    lspconfig.gopls.setup(require"coq".lsp_ensure_capabilities({
        on_attach = M.on_attach,
        capabilities = capabilities,
        root_dir = vim.loop.cwd,
        settings = { gopls = { buildFlags = {"-tags=all"}}}
    }))

    lspconfig.sumneko_lua.setup(require"coq".lsp_ensure_capabilities({
        root_dir = vim.loop.cwd,
        settings = {
            Lua = {
                diagnostics = { globals = { "vim" } },
                workspace = {
                    library = {
                        [vim.fn.expand("$VIMRUNTIME/lua")] = true,
                        [vim.fn.expand("$VIMRUNTIME/lua/vim/lsp")] = true
                    },
                    maxPreload = 100000,
                    preloadFileSize = 10000
                },
                telemetry = { enable = false }
            }
        }
    }))

    vim.fn.sign_define("LspDiagnosticsSignError",
                       { text = "", numhl = "LspDiagnosticsDefaultError" })
    vim.fn.sign_define("LspDiagnosticsSignWarning",
                       { text = "", numhl = "LspDiagnosticsDefaultWarning" })
    vim.fn.sign_define("LspDiagnosticsSignInformation",
                       { text = "", numhl = "LspDiagnosticsDefaultInformation" })
    vim.fn.sign_define("LspDiagnosticsSignHint",
                       { text = "", numhl = "LspDiagnosticsDefaultHint" })
end

return M
