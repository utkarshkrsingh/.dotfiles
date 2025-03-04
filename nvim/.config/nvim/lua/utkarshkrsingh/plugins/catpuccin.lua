return {
	"catppuccin/nvim",
	lazy = false,
	name = "catppuccin",
	priority = 1000,
	config = function()
		require("catppuccin").setup({
			flavour = "mocha",
            term_colors = true,
            color_overrides = {
                mocha = {
                    base = "#11111b"
                }
            }
		})
		vim.cmd.colorscheme("catppuccin")
	end,
}
