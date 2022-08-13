-- https://github.com/mfussenegger/nvim-jdtls#configuration
local project_name = vim.fn.fnamemodify(vim.fn.getcwd(), ":p:h:t")
local workspace_dir = "/home/daniel/workspace/" .. project_name
local java = "/home/daniel/.jabba/jdk/openjdk@1.17.0/bin/java"
local eclipse_home = "/home/daniel/ghq/github.com/eclipse/eclipse.jdt.ls/org.eclipse.jdt.ls.product/target/repository"
local jar = "/plugins/org.eclipse.equinox.launcher_1.6.400.v20210924-0641.jar"
local config_linux = "/config_linux"

-- TODO: This is somewhat duplicated code between plugins.lspconfig and here
local capabilities = vim.lsp.protocol.make_client_capabilities()
capabilities.textDocument.completion.completionItem.snippetSupport = true

local setup = require"coq".lsp_ensure_capabilities({
    on_attach = require"plugins.lspconfig".on_attach,
    capabilities = capabilities,
    cmd = {
        java,
        "-Declipse.application=org.eclipse.jdt.ls.core.id1",
        "-Dosgi.bundles.defaultStartLevel=4",
        "-Declipse.product=org.eclipse.jdt.ls.core.product",
        "-Dlog.protocol=true",
        "-Dlog.level=ALL",
        "-Xms1g",
        "--add-modules=ALL-SYSTEM",
        "--add-opens", "java.base/java.util=ALL-UNNAMED",
        "--add-opens", "java.base/java.lang=ALL-UNNAMED",
        "-jar", eclipse_home .. jar,
        "-configuration", eclipse_home .. config_linux,
        "-data", workspace_dir
    },
    root_dir = require"jdtls.setup".find_root({'.git', 'mvnw', 'gradlew'}),
})

require"jdtls".start_or_attach(setup)
