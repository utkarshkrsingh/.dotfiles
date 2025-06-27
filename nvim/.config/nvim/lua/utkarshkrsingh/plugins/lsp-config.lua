return {
    "neovim/nvim-lspconfig",
    event = { "BufReadPre", "BufNewFile" },
    dependencies = {
        "hrsh7th/cmp-nvim-lsp",
        { "folke/neodev.nvim", opts = {} }, -- For Lua development
    },
    config = function()
        local cmp_nvim_lsp = require("cmp_nvim_lsp")
        local mason_lspconfig = require("mason-lspconfig")

        -- Enhanced diagnostics configuration
        vim.diagnostic.config({
            virtual_text = {
                severity = { min = vim.diagnostic.severity.WARN },
                prefix = "●",
            },
            signs = true,
            underline = true,
            update_in_insert = false,
            severity_sort = true,
            float = {
                border = "rounded",
                source = "if_many",
                header = "",
                format = function(diagnostic)
                    return string.format(
                        "%s (%s) [%s]",
                        diagnostic.message,
                        diagnostic.source,
                        diagnostic.code or diagnostic.user_data.lsp.code
                    )
                end,
            },
        })

        -- Show diagnostics on hover with delay
        vim.api.nvim_create_autocmd("CursorHold", {
            callback = function()
                if #vim.diagnostic.get() > 0 then
                    vim.diagnostic.open_float(nil, {
                        focusable = false,
                        border = "rounded",
                    })
                end
            end,
        })

        -- Keymaps for LSP
        local on_attach = function(client, bufnr)
            -- Enable format on save if server supports it
            if client.supports_method("textDocument/formatting") then
                vim.api.nvim_create_autocmd("BufWritePre", {
                    group = vim.api.nvim_create_augroup("LspFormat", { clear = true }),
                    buffer = bufnr,
                    callback = function()
                        vim.lsp.buf.format({
                            filter = function(c)
                                -- Let prettier handle these formats
                                return not (c.name == "ts_ls" or c.name == "eslint")
                            end,
                            bufnr = bufnr,
                            timeout_ms = 3000,
                        })
                    end,
                })
            end

            -- Options for key mappings: apply to the current buffer, and be silent
            local opts = { buffer = bufnr, silent = true }
            -- Go to definition of symbol under cursor
            vim.keymap.set("n", "gd", vim.lsp.buf.definition, opts)
            -- Go to declaration of symbol under cursor
            vim.keymap.set("n", "gD", vim.lsp.buf.declaration, opts)
            -- Show hover documentation for symbol under cursor
            vim.keymap.set("n", "K", vim.lsp.buf.hover, opts)
            -- Go to implementation(s) of symbol under cursor
            vim.keymap.set("n", "gi", vim.lsp.buf.implementation, opts)
            -- Show available code actions (e.g. quick fixes, refactors)
            vim.keymap.set("n", "<leader>ca", vim.lsp.buf.code_action, opts)
            -- Rename the symbol under the cursor
            vim.keymap.set("n", "<leader>rn", vim.lsp.buf.rename, opts)
            -- Open floating window with diagnostics for the current line
            vim.keymap.set("n", "<leader>fd", vim.diagnostic.open_float, opts)
            -- Show all references to the symbol under the cursor
            vim.keymap.set("n", "<leader>fr", vim.lsp.buf.references, opts)
            -- Format the current buffer using the LSP
            vim.keymap.set("n", "<leader>fm", vim.lsp.buf.format, opts)
        end

        -- Enhanced capabilities
        local capabilities = cmp_nvim_lsp.default_capabilities()
        capabilities.textDocument.completion.completionItem = {
            snippetSupport = true,
            resolveSupport = {
                properties = {
                    "documentation",
                    "detail",
                    "additionalTextEdits",
                },
            },
        }

        -- Configure all servers
        mason_lspconfig.setup({
            ["ts_ls"] = function()
                require("lspconfig").ts_ls.setup({
                    on_attach = on_attach,
                    capabilities = capabilities,
                    init_options = {
                        preferences = {
                            disableSuggestions = true,
                            importModuleSpecifierPreference = "relative",
                        },
                    },
                })
            end,

            ["gopls"] = function()
                require("lspconfig").gopls.setup({
                    on_attach = on_attach,
                    capabilities = capabilities,
                    settings = {
                        gopls = {
                            analyses = {
                                unusedparams = true,
                                shadow = true,
                            },
                            staticcheck = true,
                            gofumpt = true,
                            usePlaceholders = true,
                        },
                    },
                })
            end,

            ["cssls"] = function()
                require("lspconfig").cssls.setup({
                    on_attach = on_attach,
                    capabilities = capabilities,
                    settings = {
                        css = {
                            validate = true,
                            lint = {
                                unknownAtRules = "ignore",
                            },
                        },
                        scss = {
                            validate = true,
                        },
                        less = {
                            validate = true,
                        },
                    },
                })
            end,

            ["tailwindcss"] = function()
                require("lspconfig").tailwindcss.setup({
                    on_attach = on_attach,
                    capabilities = capabilities,
                    settings = {
                        tailwindCSS = {
                            experimental = {
                                classRegex = {
                                    "tw`([^`]*)",
                                    'tw="([^"]*)',
                                    'tw={"([^"}]*)',
                                    "tw\\.\\w+`([^`]*)",
                                    "tw\\(.*?\\)`([^`]*)",
                                },
                            },
                            validate = true,
                            lint = {
                                cssConflict = "warning",
                                invalidScreen = "error",
                                invalidVariant = "error",
                                recommendedVariantOrder = "warning",
                            },
                        },
                    },
                    filetypes = {
                        "html",
                        "javascript",
                        "javascriptreact",
                        "typescript",
                        "typescriptreact",
                        "svelte",
                        "vue",
                        "astro",
                    },
                })
            end,

            ["html"] = function()
                require("lspconfig").html.setup({
                    on_attach = on_attach,
                    capabilities = capabilities,
                    filetypes = { "html", "htmldjango" },
                    settings = {
                        html = {
                            autoClosingTags = true,
                            suggest = {
                                html5 = true,
                            },
                        },
                    },
                })
            end,

            ["jsonls"] = function()
                require("lspconfig").jsonls.setup({
                    on_attach = on_attach,
                    capabilities = capabilities,
                    settings = {
                        json = {
                            schemas = require("schemastore").json.schemas(),
                            validate = { enable = true },
                        },
                    },
                })
            end,

            ["eslint"] = function()
                require("lspconfig").eslint.setup({
                    on_attach = function(client, bufnr)
                        on_attach(client, bufnr)
                        -- ESLint needs to control formatting for JS/TS files
                        client.server_capabilities.documentFormattingProvider = true
                    end,
                    capabilities = capabilities,
                    settings = {
                        eslint = {
                            format = {
                                enable = true,
                            },
                            codeAction = {
                                disableRuleComment = {
                                    enable = true,
                                    location = "separateLine",
                                },
                                showDocumentation = {
                                    enable = true,
                                },
                            },
                            validate = "on",
                            workingDirectory = {
                                mode = "auto",
                            },
                        },
                    },
                })
            end,

            ["clangd"] = function()
                require("lspconfig").clangd.setup({
                    on_attach = on_attach,
                    capabilities = capabilities,
                    cmd = {
                        "clangd",
                        "--background-index",
                        "--clang-tidy",
                        "--header-insertion=never",
                        "--completion-style=detailed",
                    },
                })
            end,

            ["lua_ls"] = function()
                require("lspconfig").lua_ls.setup({
                    on_attach = on_attach,
                    capabilities = capabilities,
                    settings = {
                        Lua = {
                            diagnostics = {
                                globals = { "vim" },
                            },
                            workspace = {
                                checkThirdParty = false,
                                library = {
                                    [vim.fn.expand("$VIMRUNTIME/lua")] = true,
                                    [vim.fn.stdpath("config") .. "/lua"] = true,
                                },
                            },
                            telemetry = { enable = false },
                        },
                    },
                })
            end,
        })
    end,
}
