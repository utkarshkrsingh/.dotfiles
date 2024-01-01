vim.api.nvim_create_autocmd("BufWritePost", {
    group = vim.api.nvim_create_augroup("PACKER", { clear = true }),
    pattern = "plugins.lua",
    command = "source <afile> | PackerCompile",
})

return require("packer").startup(function(use)
    -- Packer
    use("wbthomason/packer.nvim")

    -- Common utilities
    use("nvim-lua/plenary.nvim")

    -- Icons
    use("nvim-tree/nvim-web-devicons")

    -- Colorscheme : Catppuccin
    use { "catppuccin/nvim", as = "catppuccin" }

    -- Lualine
    use{
        'nvim-lualine/lualine.nvim',
        config = function()
            require("nyxfr.configs.lualine")
        end,
    }

    -- LSP
    use({
        "neovim/nvim-lspconfig",
        config = function()
            require("nyxfr.configs.lsp")
        end,
    })

    use("onsails/lspkind-nvim")
    use({
        "L3MON4D3/LuaSnip",
        -- follow latest release.
        tag = "v<CurrentMajor>.*",
    })

    -- Treesitter
    use({
        "nvim-treesitter/nvim-treesitter",
        run = function()
            require("nvim-treesitter.install").update({ with_sync = true })
        end,
        config = function()
            require("nyxfr.configs.treesitter")
        end,
    })

    use({ "windwp/nvim-ts-autotag", after = "nvim-treesitter" })

    -- cmp: Autocomplete
    use({
        "hrsh7th/nvim-cmp",
        event = "InsertEnter",
        config = function()
            require("nyxfr.configs.cmp")
        end,
    })

    use("hrsh7th/cmp-nvim-lsp")

    use({ "hrsh7th/cmp-path", after = "nvim-cmp" })

    use({ "hrsh7th/cmp-buffer", after = "nvim-cmp" })

    -- File manager
    use({
        "nvim-neo-tree/neo-tree.nvim",
        branch = "v2.x",
        requires = {
            "nvim-lua/plenary.nvim",
            "nvim-tree/nvim-web-devicons",
            "MunifTanjim/nui.nvim",
        },
    })    

    -- Show colors
    use({
        "norcalli/nvim-colorizer.lua",
        config = function()
            require("colorizer").setup({ "*" })
        end,
    })

    -- Auto pairs
    use({
        "windwp/nvim-autopairs",
        config = function()
            require("nyxfr.configs.autopairs")
        end,
    })

    -- Telescope
    use {
        'nvim-telescope/telescope.nvim', tag = '0.1.5',
    }    


end)
