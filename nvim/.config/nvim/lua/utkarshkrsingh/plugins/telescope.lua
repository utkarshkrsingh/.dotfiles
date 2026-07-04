local telescope = require("telescope")
local actions = require("telescope.actions")
local builtin = require("telescope.builtin")
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
                ["<C-j>"] = actions.move_selection_next,
                ["<C-k>"] = actions.move_selection_previous,
                ["<C-q>"] = actions.send_to_qflist,
            },
        },
    },
})

pcall(telescope.load_extension, "fzf")

-- Buffers
vim.keymap.set("n", "<leader><space>", builtin.buffers, opts("Buffers"))
-- Files
vim.keymap.set("n", "<leader>ff", builtin.find_files, opts("Find files"))
vim.keymap.set("n", "<leader>fr", builtin.oldfiles, opts("Recent files"))
-- Search
vim.keymap.set("n", "<leader>fg", builtin.live_grep, opts("Live grep"))
vim.keymap.set("n", "<leader>fw", builtin.grep_string, opts("Grep string"))
-- Navigation
vim.keymap.set("n", "<leader>fh", builtin.help_tags, opts("Help tags"))
vim.keymap.set("n", "<leader>fk", builtin.keymaps, opts("Keymaps"))
vim.keymap.set("n", "<leader>fc", builtin.commands, opts("Commands"))
-- Git
vim.keymap.set("n", "<leader>gs", builtin.git_status, opts("Git status"))
vim.keymap.set("n", "<leader>gc", builtin.git_commits, opts("Git commits"))
