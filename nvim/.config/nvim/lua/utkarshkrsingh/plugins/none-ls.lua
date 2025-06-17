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

                -- C/C++ formatting via null-ls
                formatting.clang_format.with({
                    extra_args = {
                        "--style={BasedOnStyle: LLVM, IndentWidth: 4, UseTab: Never}",
                    },
                }),

                -- Shell scripting
                formatting.shfmt.with({
                    extra_args = { "-i", "4" },
                }),
                diagnostics.shellcheck,
            },
        })

        -- Filetypes you want to force through null-ls (e.g., for custom clang-format)
        local prefer_null_ls = {
            lua = true,
            c = true,
            cpp = true,
            html = true,
        }

        -- Format keymap
        vim.keymap.set("n", "<leader>f", function()
            vim.lsp.buf.format({
                filter = function(client)
                    if prefer_null_ls[vim.bo.filetype] then
                        return client.name == "null-ls"
                    end
                    return client.name ~= "null-ls"
                end,
                async = true,
            })
        end, { desc = "Format file" })

        -- Format on save
        vim.api.nvim_create_autocmd("BufWritePre", {
            callback = function()
                vim.lsp.buf.format({
                    filter = function(client)
                        if prefer_null_ls[vim.bo.filetype] then
                            return client.name == "null-ls"
                        end
                        return client.name ~= "null-ls"
                    end,
                    async = false,
                })
            end,
        })
    end,
}
