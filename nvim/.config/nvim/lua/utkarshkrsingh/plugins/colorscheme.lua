-- ~/.config/nvim/lua/utkarshkrsingh/plugins/colorscheme.lua

return {
    "folke/tokyonight.nvim",
    lazy = false,
    priority = 1000,
    opts = {
        transparent = true, -- enables transparency
        styles = {
            sidebars = "transparent",
            floats = "transparent",
        },
    },
}
