return {
	"neovim/nvim-lspconfig",
	event = { "BufReadPre", "BufNewFile" },
	dependencies = {
		"hrsh7th/cmp-nvim-lsp",
		{ "folke/neodev.nvim", opts = {} },
	},
	config = function()
		local nvim_lsp = require("lspconfig")
		local mason_lspconfig = require("mason-lspconfig")

		local protocol = require("vim.lsp.protocol")

        local capabilities = require('cmp_nvim_lsp').default_capabilities()
        capabilities.textDocument.completion.completionItem.snippetSupport = true
        capabilities.textDocument.completion.completionItem.preselectSupport = true
        capabilities.textDocument.completion.completionItem.insertReplaceSupport = true
        capabilities.textDocument.completion.completionItem.labelDetailsSupport = true
        capabilities.textDocument.completion.completionItem.deprecatedSupport = true
        capabilities.textDocument.completion.completionItem.commitCharactersSupport = true
        capabilities.textDocument.completion.completionItem.tagSupport = { valueSet = { 1 } }
        capabilities.textDocument.completion.completionItem.resolveSupport = {
            properties = {
                'documentation',
                'detail',
                'additionalTextEdits',
            }
        }

		local on_attach = function(client, bufnr)
			-- format on save
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

		vim.keymap.set("n", "fd", vim.lsp.buf.hover, {})
		vim.keymap.set("n", "cd", vim.lsp.buf.definition, {})
		vim.keymap.set("n", "ca", vim.lsp.buf.code_action, {})

		-- local capabilities = require("cmp_nvim_lsp").default_capabilities()
		local capabilities = vim.lsp.protocol.make_client_capabilities()
		capabilities.textDocument.completion.completionItem.snippetSupport = true

		mason_lspconfig.setup_handlers({
			function(server)
				nvim_lsp[server].setup({
					capabilities = capabilities,
				})
			end,
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
			["gopls"] = function()
				nvim_lsp["gopls"].setup({
					on_attach = on_attach,
					capabilities = capabilities,
				})
			end,
			["emmet_ls"] = function()
				nvim_lsp["emmet_ls"].setup({
					on_attach = on_attach,
					capabilities = capabilities,
				})
			end,
			["clangd"] = function()
				nvim_lsp["clangd"].setup({
					on_attach = on_attach,
					capabilities = capabilities,
				})
			end,
			["rust_analyzer"] = function()
				nvim_lsp["rust_analyzer"].setup({
					on_attach = on_attach,
					capabilities = capabilities,
				})				
			end,
			["jdtls"] = function()
				nvim_lsp["jdtls"].setup({
					on_attach = on_attach,
					capabilities = capabilities,
					-- Java-specific settings can be added here
					settings = {
						java = {
							-- Example configuration options:
							-- configuration = {
							-- 	runtimes = {
							-- 		{
							-- 			name = "JavaSE-17",
							-- 			path = "/path/to/jdk-17",
							-- 		},
							-- 	}
							-- },
							-- signatureHelp = { enabled = true },
							-- contentProvider = { preferred = 'fernflower' },
						}
					},
					root_dir = function()
						return vim.fn.getcwd()
					end,
				})
			end,
		})
	end,
}
