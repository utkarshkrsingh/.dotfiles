-- ~/.config/nvim/lua/utkarshkrsingh/plugins/telescope.lua
return {
    "nvim-telescope/telescope.nvim",
    tag = "0.1.8",
    dependencies = {
        "nvim-lua/plenary.nvim",
        { "nvim-telescope/telescope-fzf-native.nvim", build = "make" },
    },
    config = function()
        local telescope = require("telescope")
        local builtin = require("telescope.builtin")

        telescope.setup({
            defaults = {
                prompt_prefix = "   ",
                selection_caret = " ",
                path_display = { "smart" },

                layout_config = {
                    horizontal = { preview_width = 0.55 },
                },

                file_ignore_patterns = {
                    "node_modules",
                    ".git/",
                    "dist",
                },

                mappings = {
                    i = {
                        ["<C-j>"] = "move_selection_next",
                        ["<C-k>"] = "move_selection_previous",
                        ["<C-q>"] = "send_to_qflist",
                    },
                },
            },
        })

        -- load extensions
        telescope.load_extension("fzf")

        -- 🔑 KEYMAPS (your new "file explorer")

        -- buffers (like alt-tab)
        vim.keymap.set("n", "<leader><space>", builtin.buffers)

        -- files
        vim.keymap.set("n", "<leader>ff", builtin.find_files)
        vim.keymap.set("n", "<leader>fr", builtin.oldfiles)

        -- search
        vim.keymap.set("n", "<leader>fg", builtin.live_grep)
        vim.keymap.set("n", "<leader>fw", builtin.grep_string)

        -- navigation
        vim.keymap.set("n", "<leader>fh", builtin.help_tags)
        vim.keymap.set("n", "<leader>fk", builtin.keymaps)
        vim.keymap.set("n", "<leader>fc", builtin.commands)

        -- LSP (super important)
        vim.keymap.set("n", "gd", builtin.lsp_definitions)
        vim.keymap.set("n", "gr", builtin.lsp_references)
        vim.keymap.set("n", "gi", builtin.lsp_implementations)
        vim.keymap.set("n", "<leader>ds", builtin.lsp_document_symbols)

        -- git (if using lazygit plugin alongside)
        vim.keymap.set("n", "<leader>gs", builtin.git_status)
        vim.keymap.set("n", "<leader>gc", builtin.git_commits)
    end,
}
