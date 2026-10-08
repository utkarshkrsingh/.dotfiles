local mason = require("mason")
local mason_lspconfig = require("mason-lspconfig")

mason.setup({
    ui = {
        icons = {
            package_installed = "✓",
            package_pending = "➜",
            package_uninstalled = "✗",
        },
    },
})

require("mason-tool-installer").setup({
    ensure_installed = {
        -- Formatters
        "prettier",
        "stylua",
        "clang-format",
        "goimports",
        "gofumpt",
        "black",
    },

    auto_update = false,
    run_on_start = true,
})

mason_lspconfig.setup({
    automatic_enable = false,
    ensure_installed = {
        "lua_ls",
        "vue_ls",
        "ts_ls",
        "html",
        "cssls",
        "gopls",
        "tailwindcss",
        "clangd",
        "emmet_language_server",
    }
})
