-- ~/.config/nvim/lua/utkarshkrsingh/plugins/toggleterm.lua
return {
	{
		"akinsho/toggleterm.nvim",
		version = "*",
		opts = {
			size = 20,
			open_mapping = [[<leader>t]], -- keybinding here
			hide_numbers = true,
			shade_terminals = true,
			shading_factor = 2,
			start_in_insert = true,
			insert_mappings = true,
			terminal_mappings = true,
			persist_size = true,
			direction = "horizontal", -- try "float" or "vertical"
			close_on_exit = true,
			shell = vim.o.shell,
		},
	},
}
