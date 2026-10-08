local lsp_group = vim.api.nvim_create_augroup("lsp_keymaps", { clear = true })

-- Diagnostics

local diagnostic_signs = {
	[vim.diagnostic.severity.ERROR] = " ",
	[vim.diagnostic.severity.WARN] = " ",
	[vim.diagnostic.severity.HINT] = "󰠠 ",
	[vim.diagnostic.severity.INFO] = " ",
}

vim.o.winborder = "rounded"

vim.diagnostic.config({
	signs = {
		text = diagnostic_signs,
	},

	virtual_text = {
		prefix = "●",
		spacing = 2,
		source = "if_many",
	},

	underline = true,
	severity_sort = true,
	update_in_insert = false,

	float = {
		focusable = false,
		style = "minimal",
		source = true,
		prefix = "●",
	},
})

-- Capabilities (nvim-cmp)

local capabilities = require("cmp_nvim_lsp").default_capabilities()

capabilities.textDocument.completion.completionItem.documentationFormat = {
	"markdown",
	"plaintext",
}

-- Global defaults for all servers

vim.lsp.config("*", {
	capabilities = capabilities,
})

-- Keymaps

vim.api.nvim_create_autocmd("LspAttach", {
	group = lsp_group,

	callback = function(event)
		local opts = function(desc)
			return {
				buffer = event.buf,
				silent = true,
				desc = desc,
			}
		end

		local client = vim.lsp.get_client_by_id(event.data.client_id)

		-- Enable inlay hints automatically
		if client and client:supports_method(vim.lsp.protocol.Methods.textDocument_inlayHint) then
			vim.lsp.inlay_hint.enable(true, {
				bufnr = event.buf,
			})
		end

		-- Navigation
		vim.keymap.set("n", "gd", vim.lsp.buf.definition, opts("Goto definition"))

		vim.keymap.set("n", "gD", vim.lsp.buf.declaration, opts("Goto declaration"))

		vim.keymap.set("n", "gi", vim.lsp.buf.implementation, opts("Goto implementation"))

		vim.keymap.set("n", "go", vim.lsp.buf.type_definition, opts("Goto type definition"))

		vim.keymap.set("n", "gr", vim.lsp.buf.references, opts("References"))

		-- Documentation
		vim.keymap.set("n", "K", vim.lsp.buf.hover, opts("Hover"))

		vim.keymap.set("n", "gs", vim.lsp.buf.signature_help, opts("Signature help"))

		-- Actions
		vim.keymap.set("n", "<F2>", vim.lsp.buf.rename, opts("Rename"))

		vim.keymap.set("n", "<leader>ca", vim.lsp.buf.code_action, opts("Code action"))

		vim.keymap.set({ "n", "x" }, "<F3>", function()
			require("conform").format({
				async = true,
				lsp_fallback = true,
			})
		end, opts("Format"))

		-- Diagnostics
		vim.keymap.set("n", "<leader>e", vim.diagnostic.open_float, opts("Line diagnostics"))
	end,
})

-- lua_ls

vim.lsp.config("lua_ls", {
	settings = {
		Lua = {
			diagnostics = {
				globals = { "vim" },
			},

			completion = {
				callSnippet = "Replace",
			},
		},
	},
})

-- ts_ls

local mason_registry = require("mason-registry")
local vue_language_server_path = mason_registry.get_package("vue-language-server"):get_install_path()
	.. "/node_modules/@vue/language-server"
local vue_plugin = {
	name = "@vue/typescript-plugin",
	location = vue_language_server_path,
	languages = { "vue" },
}
vim.lsp.config("ts_ls", {
	workspace_required = false,

	filetypes = {
		"javascript",
		"javascriptreact",
		"typescript",
		"typescriptreact",
		"vue",
	},

	single_file_support = true,
	init_options = {
		preferences = {
			includeCompletionsForModuleExports = true,
			includeCompletionsForImportStatements = true,
		},
		plugins = {
			vue_plugin,
		},
	},
})

-- vue_ls
vim.lsp.config("vue_ls", {})

-- emmet_language_server

vim.lsp.config("emmet_language_server", {
	filetypes = {
		"astro",
		"html",
		"typescriptreact",
		"javascriptreact",
		"css",
		"sass",
		"scss",
		"less",
		"vue",
	},
})

-- clangd
vim.lsp.config("clangd", {})

-- gopls

vim.lsp.config("gopls", {
	settings = {
		gopls = {
			analyses = {
				unusedparams = true,
			},

			staticcheck = true,
			gofumpt = true,
		},
	},
})

-- cssls

vim.lsp.config("cssls", {
	filetypes = {
		"css",
		"scss",
		"less",
	},

	init_options = {
		provideFormatter = true,
	},

	settings = {
		css = {
			lint = {
				unknownAtRules = "ignore",
			},
			validate = true,
		},

		scss = {
			lint = {
				unknownAtRules = "ignore",
			},
			validate = true,
		},

		less = {
			lint = {
				unknownAtRules = "ignore",
			},
			validate = true,
		},
	},
})

-- tailwindcss

vim.lsp.config("tailwindcss", {
	filetypes = {
		"html",
		"css",
		"javascript",
		"typescript",
		"javascriptreact",
		"typescriptreact",
		"vue",
	},

	init_options = {
		userLanguages = {
			astro = "html",
		},
	},
})

-- Enable servers

vim.lsp.enable({
	"lua_ls",
	"ts_ls",
	"gopls",
	"cssls",
	"tailwindcss",
	"vue_ls",
	"emmet_language_server",
	"clangd",
})
