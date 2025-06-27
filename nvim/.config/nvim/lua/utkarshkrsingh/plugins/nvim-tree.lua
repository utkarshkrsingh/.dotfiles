return {
    "nvim-tree/nvim-tree.lua",
    version = "*",
    lazy = false,
    dependencies = {
        "nvim-tree/nvim-web-devicons",
    },
    keys = {
        { "<leader>e", "<cmd>NvimTreeToggle<cr>", desc = "Toggle File Explorer" },
        { "<leader>o", "<cmd>NvimTreeFocus<cr>", desc = "Focus To File Explorer" },
    },
    config = function()
        require("nvim-tree").setup({})
    end,
}
