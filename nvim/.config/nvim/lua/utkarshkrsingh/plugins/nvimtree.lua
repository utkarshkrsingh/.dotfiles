return {
	"nvim-tree/nvim-tree.lua",
	dependencies = {
		"nvim-tree/nvim-web-devicons",
	},

	config = function()
		require("nvim-tree").setup({
			sync_root_with_cwd = true,
			respect_buf_cwd = true,

			view = {
				width = 30,
			},

			filters = {
				dotfiles = false,
			},

			renderer = {
				indent_markers = {
					enable = true,
				},
			},

			actions = {
				open_file = {
					resize_window = true,
				},
			},

			renderer = {
				icons = {
					glyphs = {
						default = "",
						folder = {
							arrow_closed = "▸",
							arrow_open = "▾",
							default = "",
							open = "",
						},
					},
				},
			},
		})

		-- Smart toggle keybinding
		vim.keymap.set("n", "<leader>o", function()
			local api = require("nvim-tree.api")

			if api.tree.is_visible() then
				if vim.bo.filetype == "NvimTree" then
					api.tree.close()
				else
					api.tree.focus()
				end
			else
				api.tree.open()
				api.tree.find_file({ open = true, focus = true })
			end
		end, { desc = "NvimTree smart toggle" })

		-- Auto open on startup with file or directory
		-- vim.api.nvim_create_autocmd("BufReadPost", {
		-- 	callback = function()
		-- 		if vim.g.nvim_tree_opened then
		-- 			return
		-- 		end
		--
		-- 		local file = vim.api.nvim_buf_get_name(0)
		-- 		if file == "" then
		-- 			return
		-- 		end
		--
		-- 		vim.g.nvim_tree_opened = true
		--
		-- 		vim.defer_fn(function()
		-- 			local api = require("nvim-tree.api")
		--
		-- 			local current_win = vim.api.nvim_get_current_win()
		--
		-- 			api.tree.open()
		-- 			api.tree.find_file({ open = true, focus = false })
		--
		-- 			-- 👇 go back to your file
		-- 			vim.api.nvim_set_current_win(current_win)
		-- 		end, 50)
		-- 	end,
		-- })
	end,
}
