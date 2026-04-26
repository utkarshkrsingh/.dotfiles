return {
	-- DAP core
	{
		"mfussenegger/nvim-dap",
		config = function()
			local dap = require("dap")

			local map = vim.keymap.set
			map("n", "<leader>dc", dap.continue, { desc = "Continue" })
			map("n", "<leader>db", dap.toggle_breakpoint, { desc = "Toggle Breakpoint" })

			map("n", "<space>n", dap.step_over, { desc = "Step Over" }) -- next
			map("n", "<space>i", dap.step_into, { desc = "Step Into" }) -- into
			map("n", "<space>o", dap.step_out, { desc = "Step Out" }) -- out

			map("n", "<leader>dq", function()
				dap.terminate()
				require("dapui").close()
			end, { desc = "Quit Debugging" })
		end,
	},

	-- Mason integration for DAP
	{
		"jay-babu/mason-nvim-dap.nvim",
		dependencies = {
			"mason-org/mason.nvim",
			"mfussenegger/nvim-dap",
		},
		opts = {
			ensure_installed = {
				"codelldb", -- C/C++/Rust
			},
			handlers = {},
		},
	},

	-- UI for DAP
	{
		"rcarriga/nvim-dap-ui",
		dependencies = {
			"mfussenegger/nvim-dap",
			"nvim-neotest/nvim-nio",
		},
		config = function()
			local dap = require("dap")
			local dapui = require("dapui")

			dapui.setup()

			-- Auto open/close UI
			dap.listeners.before.attach.dapui_config = function()
				dapui.open()
			end
			dap.listeners.before.launch.dapui_config = function()
				dapui.open()
			end
			dap.listeners.before.event_terminated.dapui_config = function()
				dapui.close()
			end
			dap.listeners.before.event_exited.dapui_config = function()
				dapui.close()
			end
		end,
	},

	{
		"thehamsta/nvim-dap-virtual-text",
		config = function()
			require("nvim-dap-virtual-text").setup({
				enable = true,
				highlight_changed_variables = false,
				all_frames = false,
				virt_text_pos = "eol",
			})
		end,
	},
}
