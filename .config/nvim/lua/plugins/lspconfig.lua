local M = {}

M.config = function()
    local function on_attach(client, bufnr)
        vim.api.nvim_buf_set_option(bufnr, "omnifunc", "v:lua.vim.lsp.omnifunc")

        local opts = { noremap = true, silent = true }

        vim.api
            .nvim_buf_set_keymap(bufnr, "n", "gD", "<Cmd>lua vim.lsp.buf.declaration()<CR>", opts)
        vim.api.nvim_buf_set_keymap(bufnr, "n", "gd", "<Cmd>lua vim.lsp.buf.definition()<CR>", opts)
        vim.api.nvim_buf_set_keymap(bufnr, "n", "K", "<Cmd>lua vim.lsp.buf.hover()<CR>", opts)
        vim.api.nvim_buf_set_keymap(bufnr, "n", "gi", "<cmd>lua vim.lsp.buf.implementation()<CR>",
                                    opts)
        vim.api.nvim_buf_set_keymap(bufnr, "n", "<C-k>",
                                    "<cmd>lua vim.lsp.buf.signature_help()<CR>", opts)
        vim.api.nvim_buf_set_keymap(bufnr, "n", "<space>D",
                                    "<cmd>lua vim.lsp.buf.type_definition()<CR>", opts)
        vim.api.nvim_buf_set_keymap(bufnr, "n", "<space>rn", "<cmd>lua vim.lsp.buf.rename()<CR>",
                                    opts)
        vim.api.nvim_buf_set_keymap(bufnr, "n", "gr", "<cmd>lua vim.lsp.buf.references()<CR>", opts)
        vim.api.nvim_buf_set_keymap(bufnr, "n", "<space>e",
                                    "<cmd>lua vim.lsp.diagnostic.show_line_diagnostics()<CR>", opts)
        vim.api.nvim_buf_set_keymap(bufnr, "n", "[d", "<cmd>lua vim.lsp.diagnostic.goto_prev()<CR>",
                                    opts)
        vim.api.nvim_buf_set_keymap(bufnr, "n", "]d", "<cmd>lua vim.lsp.diagnostic.goto_next()<CR>",
                                    opts)
        vim.api.nvim_buf_set_keymap(bufnr, "n", "<space>q",
                                    "<cmd>lua vim.lsp.diagnostic.set_loclist()<CR>", opts)
    end

    local capabilities = vim.lsp.protocol.make_client_capabilities()
    capabilities.textDocument.completion.completionItem.snippetSupport = true

    local function setup_servers()
        require"lspinstall".setup()
        local servers = require"lspinstall".installed_servers()

        require"lspconfig".sourcekit.setup(require"coq".lsp_ensure_capabilities({
            on_attach = on_attach,
            capabilities = capabilities,
            root_dir = vim.loop.cwd
        }))

        for _, lang in pairs(servers) do
            if lang ~= "lua" then
                require"lspconfig"[lang].setup(require"coq".lsp_ensure_capabilities({
                    on_attach = on_attach,
                    capabilities = capabilities,
                    root_dir = vim.loop.cwd
                }))
            elseif lang == "lua" then
                require"lspconfig"[lang].setup(require"coq".lsp_ensure_capabilities({
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
            end
        end
    end

    setup_servers()

    require"lspinstall".post_install_hook = function()
        setup_servers()
        vim.cmd("bufdo e")
    end

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
