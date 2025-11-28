-- ~/.config/nvim/lua/utkarshkrsingh/plugins/lsp.lua
return {
    {
        "neovim/nvim-lspconfig",
        dependencies = {
            "hrsh7th/cmp-nvim-lsp",
            "hrsh7th/nvim-cmp",
        },
        config = function()
            local lspconfig = require("lspconfig")
            -- Enable inline diagnostics!
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

            -- Fix capabilities
            local lsp_defaults = lspconfig.util.default_config
            lsp_defaults.capabilities = vim.tbl_deep_extend(
                "force",
                lsp_defaults.capabilities,
                require("cmp_nvim_lsp").default_capabilities()
            )

            -- Custom border styles for LSP handlers
            local border = "rounded"

            -- Apply borders to all LSP handlers
            local orig_util_open_floating_preview = vim.lsp.util.open_floating_preview
            function vim.lsp.util.open_floating_preview(contents, syntax, opts, ...)
                opts = opts or {}
                opts.border = opts.border or border
                return orig_util_open_floating_preview(contents, syntax, opts, ...)
            end

            -- LSP keymaps
            vim.api.nvim_create_autocmd("LspAttach", {
                callback = function(event)
                    local opt = { buffer = event.buf }
                    vim.keymap.set("n", "K", "<cmd>lua vim.lsp.buf.hover()<CR>", opt)
                    vim.keymap.set("n", "gd", "<cmd>lua vim.lsp.buf.definition()<CR>", opt)
                    vim.keymap.set("n", "gD", "<cmd>lua vim.lsp.buf.declaration()<CR>", opt)
                    vim.keymap.set("n", "gi", "<cmd>lua vim.lsp.buf.implementation()<CR>", opt)
                    vim.keymap.set("n", "go", "<cmd>lua vim.lsp.buf.type_definition()<CR>", opt)
                    vim.keymap.set("n", "gr", "<cmd>lua vim.lsp.buf.references()<CR>", opt)
                    vim.keymap.set("n", "gs", "<cmd>lua vim.lsp.buf.signature_help()<CR>", opt)
                    vim.keymap.set("n", "<F2>", "<cmd>lua vim.lsp.buf.rename()<CR>", opt)
                    vim.keymap.set({ "n", "x" }, "<F3>", "<cmd>lua vim.lsp.buf.format({ async = true })<CR>", opt)
                    vim.keymap.set("n", "<F4>", "<cmd>lua vim.lsp.buf.code_action()<CR>", opt)
                end
            })

            -- Configure hover with border
            vim.lsp.handlers["textDocument/hover"] = vim.lsp.with(
                vim.lsp.handlers.hover, {
                    border = border
                }
            )

            -- Configure signature help with border
            vim.lsp.handlers["textDocument/signatureHelp"] = vim.lsp.with(
                vim.lsp.handlers.signature_help, {
                    border = border
                }
            )

            -- Configure diagnostics with border
            vim.lsp.handlers["textDocument/publishDiagnostics"] = vim.lsp.with(
                vim.lsp.diagnostic.on_publish_diagnostics, {
                    virtual_text = {
                        prefix = "●",
                        spacing = 2,
                    },
                    float = {
                        border = border
                    }
                }
            )
        end
    },
    {
        "mason-org/mason.nvim",
        cmd = "Mason",
        config = function()
            require("mason").setup({
                ensure_installed = {
                    "clang-format",
                    "prettier"
                },
                automatic_installation = true,
            })
        end
    },
    {
        "mason-org/mason-lspconfig.nvim",
        dependencies = {
            "neovim/nvim-lspconfig",
            "mason-org/mason.nvim"
        },
        config = function()
            local lspconfig = require("lspconfig")

            require("mason-lspconfig").setup({
                ensure_installed = {
                    "lua_ls",
                    "clangd",
                    "ts_ls",
                    "tailwindcss",
                    "gopls",
                    "html",
                    "cssls",
                    "dockerls",
                    "rust_analyzer",
                    "angularls",
                },
                automatic_installation = true,
            })

            require("mason-lspconfig").setup({
                function(server_name)
                    lspconfig[server_name].setup({
                        on_attach = function(client, bufnr)
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
            })
        end
    }
}
