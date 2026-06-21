-- ~/.config/nvim/lua/utkarshkrsingh/plugins/colorscheme.lua
return {
	{
		"folke/tokyonight.nvim",
		opts = {
			transparent = true,
			styles = {
				sidebars = "transparent",
				floats = "transparent",
			},
			on_highlights = function(hl, c)
				hl.CursorLine = { bg = "none" }
				hl.CursorColumn = { bg = c.bg_highlight }
			end,
		},
		config = function(_, opts)
			require("tokyonight").setup(opts)
			vim.cmd.colorscheme("tokyonight")
		end,
	},
}
