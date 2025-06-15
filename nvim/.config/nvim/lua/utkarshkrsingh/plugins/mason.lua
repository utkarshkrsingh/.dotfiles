return {
    "williamboman/mason.nvim",
    dependencies = {
        "williamboman/mason-lspconfig.nvim",
        "WhoIsSethDaniel/mason-tool-installer.nvim",
    },
    config = function()
        require("mason").setup()

        require("mason-lspconfig").setup({
            automatic_installation = true,
            ensure_installed = {
                "cssls",
                "eslint",
                "emmet_ls",
                "jsonls",
                "ts_ls",
                "tailwindcss",
                "gopls",
                "clangd",
                "lua_ls",
            },
        })

        require("mason-tool-installer").setup({
            ensure_installed = {
                "prettier",
                "stylua",
                "eslint_d",
                "shellcheck", -- For shell script diagnostics
                "shfmt", -- For shell script formatting
                "clang-format", -- For C/C++ formatting
                -- "gofumpt", -- If available in Mason registry
                -- "goimports", -- If available in Mason registry
                -- "delve",
            },
        })
    end,
}
