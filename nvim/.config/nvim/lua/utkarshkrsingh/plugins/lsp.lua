-- ~/.config/nvim/lua/utkarshkrsingh/plugins/lsp.lua
return {
    {
        "neovim/nvim-lspconfig",
        event = { "BufReadPre", "BufNewFile" },
        dependencies = {
            "hrsh7th/cmp-nvim-lsp",
            "hrsh7th/nvim-cmp",
        },
        config = function()
            local lspconfig = require("lspconfig")

            vim.diagnostic.config({
                virtual_text = {
                    prefix = "●",
                    spacing = 2,
                },
                signs = true,
                underline = true,
                severity_sort = true,
                update_in_insert = false,
                float = {
                    border = "rounded",
                    source = "always",
                    prefix = "●",
                }
            })

            local capabilities = require("cmp_nvim_lsp").default_capabilities()
            capabilities.textDocument.completion.completionItem.documentationFormat = { "markdown", "plaintext" }

            local lsp_defaults = lspconfig.util.default_config
            lsp_defaults.capabilities = vim.tbl_deep_extend(
                "force",
                lsp_defaults.capabilities,
                capabilities
            )

            local border = "rounded"

            -- This globally sets borders for ALL LSP floating windows (Hover, Signature, etc.)
            -- This makes the deprecated vim.lsp.with() unnecessary.
            local orig_util_open_floating_preview = vim.lsp.util.open_floating_preview
            function vim.lsp.util.open_floating_preview(contents, syntax, opts, ...)
                opts = opts or {}
                opts.border = opts.border or border
                return orig_util_open_floating_preview(contents, syntax, opts, ...)
            end

            -- LSP keymaps (buffer-local)
            vim.api.nvim_create_autocmd("LspAttach", {
                callback = function(event)
                    local opt = function(desc)
                        return { buffer = event.buf, noremap = true, silent = true, desc = desc }
                    end
                    vim.keymap.set("n", "gd", vim.lsp.buf.definition, opt("LSP definition"))
                    vim.keymap.set("n", "gD", vim.lsp.buf.declaration, opt("LSP declaration"))
                    vim.keymap.set("n", "gi", vim.lsp.buf.implementation, opt("LSP implementation"))
                    vim.keymap.set("n", "go", vim.lsp.buf.type_definition, opt("LSP type definition"))
                    vim.keymap.set("n", "gr", vim.lsp.buf.references, opt("LSP references"))
                    vim.keymap.set("n", "gs", vim.lsp.buf.signature_help, opt("LSP signature help"))
                    vim.keymap.set("n", "K", vim.lsp.buf.hover, opt("LSP hover"))
                    vim.keymap.set("n", "<F2>", vim.lsp.buf.rename, opt("LSP rename"))
                    vim.keymap.set({ "n", "x" }, "<F3>", function() vim.lsp.buf.format({ async = true }) end,
                        opt("LSP format"))
                    vim.keymap.set("n", "<leader>ca", vim.lsp.buf.code_action, opt("Code action"))
                end
            })
        end
    },
    {
        "mason-org/mason.nvim",
        cmd = "Mason",
        config = function()
            require("mason").setup()
        end
    },
    {
        "mason-org/mason-lspconfig.nvim",
        event = { "BufReadPre", "BufNewFile" },
        dependencies = {
            "neovim/nvim-lspconfig",
            "mason-org/mason.nvim",
        },
        config = function()
            local lspconfig = require("lspconfig")

            require("mason-lspconfig").setup({
                ensure_installed = {
                    "lua_ls", "clangd", "ts_ls", "tailwindcss",
                    "gopls", "html", "cssls", "dockerls",
                    "rust_analyzer", "angularls", "eslint",
                },
                automatic_installation = true,
                handlers = {
                    function(server_name)
                        lspconfig[server_name].setup({
                            on_attach = function(_, bufnr)
                                -- Auto-open diagnostics on hover
                                vim.api.nvim_create_autocmd("CursorHold", {
                                    buffer = bufnr,
                                    callback = function()
                                        vim.diagnostic.open_float(nil, {
                                            focusable = false,
                                            close_events = { "BufLeave", "CursorMoved", "InsertEnter", "FocusLost" },
                                            border = "rounded",
                                            source = "always",
                                            prefix = "●",
                                        })
                                    end
                                })
                            end
                        })
                    end
                },
            })
        end
    }
}
