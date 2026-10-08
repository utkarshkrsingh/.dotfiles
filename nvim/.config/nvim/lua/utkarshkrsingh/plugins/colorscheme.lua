require("tokyonight").setup({
    transparent = false,

    styles = {
        sidebars = "transparent",
        floats = "transparent",
    },

    on_highlights = function(hl, c)
        hl.CursorLine = { bg = "none" }
        hl.CursorColumn = { bg = c.bg_highlight }
    end,
})

require("onedark").setup({
    style = 'darker'
})

vim.cmd("colorscheme nord")
