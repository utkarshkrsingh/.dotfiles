return {
    "stevearc/conform.nvim",
    opts = {
        format_on_save = { timeout_ms = 500, lsp_fallback = true },

        formatters_by_ft = {
            lua = { "stylua" },
            python = { "black" },

            -- JS / TS / React
            javascript = { "prettier" },
            typescript = { "prettier" },
            javascriptreact = { "prettier" }, -- ← JSX support
            typescriptreact = { "prettier" }, -- ← TSX support
            astro = { "prettier" },

            json = { "prettier" },
            yaml = { "prettier" },
            css = { "prettier" },
            scss = { "prettier" },
            less = { "prettier" },
            html = { "prettier" },

            c = { "clang_format" },
            cpp = { "clang_format" },

            rust = { "rustfmt" },
        },

        formatters = {
            prettier = {
                prepend_args = {
                    "--tab-width", "4",
                    "--use-tabs", "false",
                },
            },
            stylua = {
                prepend_args = { "--indent-width", "4" },
            },
            clang_format = {
                prepend_args = {
                    "--style",
                    "{BasedOnStyle: LLVM, IndentWidth: 4, TabWidth: 4, UseTab: Never}",
                },
            },
        },
    },
}
