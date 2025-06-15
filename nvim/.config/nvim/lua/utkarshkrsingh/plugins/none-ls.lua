return {
    "nvimtools/none-ls.nvim",
    dependencies = {
        "nvim-lua/plenary.nvim",
    },
    config = function()
        local null_ls = require("null-ls")
        local formatting = null_ls.builtins.formatting
        local diagnostics = null_ls.builtins.diagnostics

        null_ls.setup({
            debug = false,
            sources = {
                -- Lua formatting
                formatting.stylua.with({
                    extra_args = { "--indent-width", "4", "--indent-type", "Spaces" },
                }),

                -- JavaScript/TypeScript/HTML/CSS formatting
                formatting.prettier.with({
                    extra_args = { "--tab-width", "4", "--use-tabs", "false" },
                    filetypes = {
                        "javascript",
                        "javascriptreact",
                        "typescript",
                        "typescriptreact",
                        "html",
                        "css",
                        "scss",
                        "less",
                        "json",
                        "yaml",
                        "markdown",
                    },
                }),

                -- C/C++ formatting
                formatting.clang_format.with({
                    extra_args = { "--style", "{BasedOnStyle: LLVM, IndentWidth: 4}" },
                }),

                -- Shell scripting
                formatting.shfmt.with({
                    extra_args = { "-i", "4" },
                }),
                diagnostics.shellcheck,

                -- Go formatting
                formatting.gofumpt,
                formatting.goimports,
            },
        })

        -- Format keymap with LSP fallback
        vim.keymap.set("n", "<leader>f", function()
            vim.lsp.buf.format({
                filter = function(client)
                    -- Use null-ls for formatting if available
                    return client.name == "null-ls"
                end,
                async = true,
            })
        end, { desc = "Format file with null-ls" })

        -- Create an autocmd to format on save for specific filetypes
        vim.api.nvim_create_autocmd("BufWritePre", {
            callback = function()
                if vim.tbl_contains({ "lua", "python", "cpp", "c", "go" }, vim.bo.filetype) then
                    vim.lsp.buf.format({
                        filter = function(client)
                            return client.name == "null-ls"
                        end,
                        async = false,
                    })
                end
            end,
        })
    end,
}
