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
					"lua_ls",               -- lua 
					"jdtls",                -- java
					"pylsp",                -- python
                    "clangd",               -- c/c++
                    "markdown_oxide",       -- markdown 
                    "cssls",                -- css 
                    "bashls",               -- bash 
                    "eslint",               -- javascript
                    "taplo",                -- toml
                    "gopls",                -- go 
                    "html",                 -- html 
                    "ts_ls",                -- typescript
                    "dockerls",             -- docker
                    "jsonls",               -- json 
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
            lspconfig.clangd.setup({ capabilities = capabilities })
            lspconfig.cmake.setup({ capabilities = capabilities })
            lspconfig.markdown_oxide.setup({ capabilities = capabilities })
            lspconfig.cssls.setup({ capabilities = capabilities })
            lspconfig.bashls.setup({ capabilities = capabilities })
            lspconfig.ts_ls.setup({ capabilities = capabilities })
            lspconfig.taplo.setup({ capabilities = capabilities })
            lspconfig.gopls.setup({ capabilities = capabilities })
            lspconfig.dockerls.setup({ capabilities = capabilities })
            lspconfig.jsonls.setup({ capabilities = capabilities })

			-- Keymaps
			vim.keymap.set("n", "<leader>fd", vim.lsp.buf.hover, {})                    -- fd --> function definition
			vim.keymap.set("n", "<leader>cd", vim.lsp.buf.definition, {})               -- cd --> code definition
			vim.keymap.set({ "n", "v" }, "<leader>ca", vim.lsp.buf.code_action, opts)   -- ca --> code action
		end,
	},

	{
		"onsails/lspkind-nvim",
	},
}
