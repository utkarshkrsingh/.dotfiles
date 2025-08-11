return {
    {
        "nvim-neo-tree/neo-tree.nvim",
        branch = "v3.x",
        dependencies = {
            "nvim-lua/plenary.nvim",
            "MunifTanjim/nui.nvim",
            "nvim-tree/nvim-web-devicons", -- optional, but recommended
        },
        lazy = false,
        config = function()
            require("neo-tree").setup({
                filesystem = {
                    filtered_items = {
                        visible = true, -- Show hidden files
                        hide_dotfiles = false, -- Do not hide dotfiles
                        hide_gitignored = false, -- Optional: show .gitignored files too
                    },
                },
            })
        end,
    },
}
