-- early pack hooks
require("utkarshkrsingh.plugins.pack-hooks")

-- plugins
vim.pack.add({
	-- core
	{ src = "https://github.com/nvim-lua/plenary.nvim" },
	{ src = "https://github.com/folke/lazydev.nvim" },

	-- all telescope
	{ src = "https://github.com/nvim-telescope/telescope.nvim", branch = "master" },
	{ src = "https://github.com/nvim-telescope/telescope-fzf-native.nvim", build = "make" },

	{ src = "https://github.com/windwp/nvim-autopairs" },
	{ src = "https://github.com/nvim-lualine/lualine.nvim" },

	-- colorscheme
	{ src = "https://github.com/folke/tokyonight.nvim" },
    { src = "https://github.com/navarasu/onedark.nvim" },
    { src = "https://github.com/shaunsingh/nord.nvim" },

	-- git
	{ src = "https://github.com/kdheepak/lazygit.nvim" },

	-- treesitter
	{ src = "https://github.com/nvim-treesitter/nvim-treesitter", branch = "main" },
	{ src = "https://github.com/windwp/nvim-ts-autotag" },

	-- LSP stack
	{ src = "https://github.com/neovim/nvim-lspconfig" },
	{ src = "https://github.com/mason-org/mason.nvim" },
	{ src = "https://github.com/mason-org/mason-lspconfig.nvim" },
    { src = "https://github.com/WhoIsSethDaniel/mason-tool-installer.nvim" },

	-- completion
	{ src = "https://github.com/hrsh7th/cmp-nvim-lsp" },
	{ src = "https://github.com/hrsh7th/nvim-cmp" },
	{ src = "https://github.com/hrsh7th/cmp-buffer" },
	{ src = "https://github.com/hrsh7th/cmp-path" },
	{ src = "https://github.com/hrsh7th/cmp-cmdline" },

	-- snippets
	{ src = "https://github.com/L3MON4D3/LuaSnip" },
	{ src = "https://github.com/saadparwaiz1/cmp_luasnip" },
	{ src = "https://github.com/rafamadriz/friendly-snippets" },
	{ src = "https://github.com/onsails/lspkind.nvim" },

	-- formatter
	{ src = "https://github.com/stevearc/conform.nvim" },

    -- file explorer
    -- { src = "https://github.com/nvim-tree/nvim-tree.lua" },
    { src = "https://github.com/nvim-tree/nvim-web-devicons" },
    { src = "https://github.com/nvim-neo-tree/neo-tree.nvim" },
    { src = "https://github.com/MunifTanjim/nui.nvim" },
    { src = "https://github.com/DaikyXendo/nvim-material-icon" },

    -- dashboard
    { src = "https://github.com/nvimdev/dashboard-nvim" },

    -- toggleterm
    { src = "https://github.com/akinsho/toggleterm.nvim" },

    { src = "https://github.com/christoomey/vim-tmux-navigator" },

    { src = "https://github.com/iamcco/markdown-preview.nvim" },
})

-- NOTE: call plugins
require("utkarshkrsingh.plugins")
