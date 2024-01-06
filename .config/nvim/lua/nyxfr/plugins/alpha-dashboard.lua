return {
	"goolord/alpha-nvim",
	config = function()
		require("alpha").setup(require("alpha.themes.dashboard").config)
		local dashboard = require("alpha.themes.dashboard")
		dashboard.section.header.val = {
            [[]],
            [[]],
            [[]],
            [[]],
            [[]],
            [[]],
            [[]],
            [[]],
			[[███╗░░██╗██╗░░░██╗██╗░░██╗███████╗██████╗░]],
			[[████╗░██║╚██╗░██╔╝╚██╗██╔╝██╔════╝██╔══██╗]],
			[[██╔██╗██║░╚████╔╝░░╚███╔╝░█████╗░░██████╔╝]],
			[[██║╚████║░░╚██╔╝░░░██╔██╗░██╔══╝░░██╔══██╗]],
			[[██║░╚███║░░░██║░░░██╔╝╚██╗██║░░░░░██║░░██║]],
			[[╚═╝░░╚══╝░░░╚═╝░░░╚═╝░░╚═╝╚═╝░░░░░╚═╝░░╚═╝]],
            [[]],
            [[]],
		}

		dashboard.section.buttons.val = {
			dashboard.button("f", " find file", ":Telescope find_files <CR>"),
			dashboard.button("p", " find project", ":lua require('telescope').extensions.projects.projects()<CR>"),
			dashboard.button("r", " recent files", ":Telescope oldfiles <CR>"),
			dashboard.button("c", " config", ":e ~/.config/nvim/init.lua <CR>"),
			dashboard.button("q", " quit", ":qa<CR>"),
		}
		dashboard.section.buttons.opts = {
			spacing = 1,
			position = "center",
		}
	end,
}
