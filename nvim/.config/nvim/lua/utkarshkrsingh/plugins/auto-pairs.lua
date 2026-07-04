require("nvim-autopairs").setup({
    check_ts = true, -- treesitter enables
    ts_config = {
        lua = { "string" }, -- dont add pairs in lua string treesitter nodes
        java = false,
    }
})
