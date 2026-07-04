require("tokyonight").setup({
    transparent = true,

    styles = {
        sidebars = "transparent",
        floats = "transparent",
    },

    on_highlights = function(hl, c)
        hl.CursorLine = { bg = "none" }
        hl.CursorColumn = { bg = c.bg_highlight }
    end,
})

vim.cmd("colorscheme tokyonight")
