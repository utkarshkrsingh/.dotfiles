return {
    "neovim/nvim-lspconfig",
    event = { "BufReadPre", "BufNewFile" },
    dependencies = {
        "hrsh7th/cmp-nvim-lsp",
        { "folke/neodev.nvim", opts = {} },
        { "windwp/nvim-autopairs", opts = {} },
    },
    config = function()
        local nvim_lsp = require("lspconfig")
        local mason_lspconfig = require("mason-lspconfig")
        local cmp_nvim_lsp = require("cmp_nvim_lsp")

        -- Setup nvim-autopairs integration
        local cmp_autopairs = require("nvim-autopairs.completion.cmp")
        local cmp = require("cmp")
        cmp.event:on(
            "confirm_done",
            cmp_autopairs.on_confirm_done()
        )

        local protocol = require("vim.lsp.protocol")

        local on_attach = function(client, bufnr)
            
            if client.server_capabilities.documentFormattingProvider then
                vim.api.nvim_create_autocmd("BufWritePre", {
                    group = vim.api.nvim_create_augroup("Format", { clear = true }),
                    buffer = bufnr,
                    callback = function()
                        vim.lsp.buf.format()
                    end,
                })
            end
        end

        -- capabilities for better autocompletion
        local capabilities = cmp_nvim_lsp.default_capabilities()
        capabilities.textDocument.completion.completionItem.snippetSupport = true
        capabilities.textDocument.completion.completionItem.preselectSupport = true
        capabilities.textDocument.completion.completionItem.insertReplaceSupport = true
        capabilities.textDocument.completion.completionItem.labelDetailsSupport = true
        capabilities.textDocument.completion.completionItem.deprecatedSupport = true
        capabilities.textDocument.completion.completionItem.commitCharactersSupport = true
        capabilities.textDocument.completion.completionItem.tagSupport = { valueSet = { 1 } }
        capabilities.textDocument.completion.completionItem.resolveSupport = {
            properties = {
                "documentation",
                "detail",
                "additionalTextEdits",
            },
        }

        vim.keymap.set("n", "fd", vim.lsp.buf.hover, {})
        vim.keymap.set("n", "cd", vim.lsp.buf.definition, {})
        vim.keymap.set("n", "ca", vim.lsp.buf.code_action, {})

        mason_lspconfig.setup({		
			["ts_ls"] = function()
                nvim_lsp["ts_ls"].setup({				
                    on_attach = on_attach,
                    capabilities = capabilities,
                })
            end,
            ["cssls"] = function()
                nvim_lsp["cssls"].setup({
                    on_attach = on_attach,
                    capabilities = capabilities,
                })
            end,
            ["tailwindcss"] = function()
                nvim_lsp["tailwindcss"].setup({
                    on_attach = on_attach,
                    capabilities = capabilities,
                })
            end,
            ["html"] = function()
                nvim_lsp["html"].setup({
                    on_attach = on_attach,
                    capabilities = capabilities,
                })
            end,
            ["jsonls"] = function()
                nvim_lsp["jsonls"].setup({
                    on_attach = on_attach,
                    capabilities = capabilities,
                })
            end,
            ["eslint"] = function()
                nvim_lsp["eslint"].setup({
                    on_attach = on_attach,
                    capabilities = capabilities,
                })
            end,
            ["pyright"] = function()
                nvim_lsp["pyright"].setup({
                    on_attach = on_attach,
                    capabilities = capabilities,
                })
            end,
        })
    end,
}
