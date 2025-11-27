-- ~/.config/nvim/lua/utkarshkrsingh/plugins/conform.luaa
return {
    "stevearc/conform.nvim",
    opts = {
        format_on_save = { timeout_ms = 500, lsp_fallback = true },
        formatters_by_ft = {
            lua = { "stylua" },
            python = { "black" },
            javascript = { "prettier" },
            typescript = { "prettier" },
            json = { "prettier" },
            yaml = { "prettier" },
            c = { "clang_format" },
            cpp = { "clang_format" },
            css = { "prettier" },
            scss = { "prettier" },
            less = { "prettier" },
            html = { "prettier" },
            rust = { "rustfmt" }
        },
        formatters = {
            prettier = {
                prepend_args = { "--tab-width", "4", "--use-tabs", "false" },
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
