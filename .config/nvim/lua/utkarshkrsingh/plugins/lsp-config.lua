return {
	-- Mason : Portable package manager
	{
		"williamboman/mason.nvim",
		config = function()
			require("mason").setup()
		end,
	},

	-- Mason Lsp Config

	{
		"williamboman/mason-lspconfig.nvim",
		config = function()
			require("mason-lspconfig").setup({
				ensure_installed = {
					"lua_ls",
					"jdtls",
					"pylsp",
					"rust_analyzer",
                    "clangd",
                    "cmake",
                    "autotools_ls",
                    "markdown_oxide",
                    "emmet_language_server",
                    "cssls",
				},
			})
		end,
	},

	-- Lsp Config

	{
		"neovim/nvim-lspconfig",
		config = function()
			local capabilities = require("cmp_nvim_lsp").default_capabilities()
			local lspconfig = require("lspconfig")
			lspconfig.lua_ls.setup({ capabilities = capabilities })
			lspconfig.jdtls.setup({ capabilities = capabilities })
			lspconfig.pylsp.setup({ capabilities = capabilities })
			lspconfig.rust_analyzer.setup({ capabilities = capabilities })
            lspconfig.clangd.setup({ capabilities = capabilities })
            lspconfig.cmake.setup({ capabilities = capabilities })
            lspconfig.autotools_ls.setup({ capabilities = capabilities })
            lspconfig.markdown_oxide.setup({ capabilities = capabilities })
            lspconfig.emmet_language_server.setup({ capabilities = capabilities })
            lspconfig.cssls.setup({ capabilities = capabilities })

			-- Keymaps
			vim.keymap.set("n", "<leader>k", vim.lsp.buf.hover, {})
			vim.keymap.set("n", "<leader>gd", vim.lsp.buf.definition, {})
			vim.keymap.set({ "n", "v" }, "<leader>ca", vim.lsp.buf.code_action, opts)
		end,
	},

	{
		"onsails/lspkind-nvim",
	},
}
