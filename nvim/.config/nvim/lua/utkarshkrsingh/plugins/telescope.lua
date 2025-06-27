return {
    "nvim-telescope/telescope.nvim",
    tag = "0.1.6",
    dependencies = {
        "nvim-lua/plenary.nvim",
        "nvim-telescope/telescope-ui-select.nvim", -- Add this line
    },
    config = function()
        local telescope = require("telescope")

        telescope.setup({
            extensions = {
                ["ui-select"] = {
                    require("telescope.themes").get_dropdown({}), -- You can customize this
                },
            },
        })

        -- Load the ui-select extension
        telescope.load_extension("ui-select")

        -- set keymaps
        local keymap = vim.keymap

        -- keymap.set("n", "<space><space>", "<cmd>Telescope find_files<cr>", { desc = "Fuzzy find files in cwd" })

        keymap.set("n", "<space><space>", function()
            require("telescope.builtin").find_files({ hidden = true })
        end, { desc = "Fuzzy find files (including dotfiles)" })
        keymap.set("n", "<space>fg", "<cmd>Telescope live_grep<cr>", { desc = "Search string in cwd" }) -- was "Fuzzy find recent files"
        keymap.set("n", "<space>fb", "<cmd>Telescope buffers<cr>", { desc = "List open buffers" }) -- was "Find string in cwd"
        keymap.set("n", "<space>fs", "<cmd>Telescope git_status<cr>", { desc = "View Git status" }) -- was "Find string under cursor in cwd"
        keymap.set("n", "<space>fc", "<cmd>Telescope git_commits<cr>", { desc = "Browse Git commits" }) -- was "Find todos"
    end,
}
