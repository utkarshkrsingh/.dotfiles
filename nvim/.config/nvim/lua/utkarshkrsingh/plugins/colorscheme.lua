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
        on_highlights = function(hl, c)
            -- make cursor line fully transparent
            hl.CursorLine = { bg = "none" }
            hl.CursorColumn = { bg = c.bg_highlight }
        end,
    },
}
