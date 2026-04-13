-- ~/.config/nvim/lua/utkarshkrsingh/plugins/telescope.lua
return {
    "nvim-telescope/telescope.nvim",
    cmd = "Telescope",
    keys = {
        { "<leader><space>", desc = "Buffers" },
        { "<leader>ff",      desc = "Find files" },
        { "<leader>fr",      desc = "Recent files" },
        { "<leader>fg",      desc = "Live grep" },
        { "<leader>fw",      desc = "Grep string" },
        { "<leader>fh",      desc = "Help tags" },
        { "<leader>fk",      desc = "Keymaps" },
        { "<leader>fc",      desc = "Commands" },
        { "<leader>ds",      desc = "Document symbols" },
        { "<leader>gs",      desc = "Git status" },
        { "<leader>gc",      desc = "Git commits" },
    },
    dependencies = {
        "nvim-lua/plenary.nvim",
        { "nvim-telescope/telescope-fzf-native.nvim", build = "make" },
    },
    config = function()
        local telescope = require("telescope")
        local builtin = require("telescope.builtin")
        local map = vim.keymap.set
        local opts = function(desc)
            return { noremap = true, silent = true, desc = desc }
        end

        telescope.setup({
            defaults = {
                prompt_prefix = " ",
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

        telescope.load_extension("fzf")

        -- Buffers
        map("n", "<leader><space>", builtin.buffers, opts("Buffers"))
        -- Files
        map("n", "<leader>ff", builtin.find_files, opts("Find files"))
        map("n", "<leader>fr", builtin.oldfiles, opts("Recent files"))
        -- Search
        map("n", "<leader>fg", builtin.live_grep, opts("Live grep"))
        map("n", "<leader>fw", builtin.grep_string, opts("Grep string"))
        -- Navigation
        map("n", "<leader>fh", builtin.help_tags, opts("Help tags"))
        map("n", "<leader>fk", builtin.keymaps, opts("Keymaps"))
        map("n", "<leader>fc", builtin.commands, opts("Commands"))
        -- Git
        map("n", "<leader>gs", builtin.git_status, opts("Git status"))
        map("n", "<leader>gc", builtin.git_commits, opts("Git commits"))
    end,
}
