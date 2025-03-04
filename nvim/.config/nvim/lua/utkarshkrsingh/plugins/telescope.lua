return {

    -- Telescope

    {
        'nvim-telescope/telescope.nvim',
        tag = '0.1.5',
        config = function()
            local builtin = require("telescope.builtin")
            vim.keymap.set("n", "<leader>ff", builtin.find_files, {})
            vim.keymap.set("n", "<leader>fg", builtin.live_grep, {})
            vim.keymap.set('n', '<leader>fb', builtin.buffers, {})
            vim.keymap.set('n', '<leader>fh', builtin.help_tags, {})
        end,
    },

    -- Telescope - UI

    {
        "nvim-telescope/telescope-ui-select.nvim",
        config = function()
            require("telescope").setup({
                extensions = {
                    ["ui-select"] = {
                        require("telescope.themes").get_dropdown {
                        }

                    }
                }
            })
            require("telescope").load_extension("ui-select")
        end,
    },

    -- Telescope - project

    {
        'nvim-telescope/telescope-project.nvim',
        dependencies = {
            'nvim-telescope/telescope.nvim',
        },
        config = function()
            require("telescope").setup({
                extensions = {
                    project = {
                        base_dirs = {
                            './',
                        },
                        hidden_files = true, -- Include hidden files
                    }
                }
            })
            require("telescope").load_extension("project")

            local builtin = require("telescope.builtin")
            vim.keymap.set('n', '<leader>fp', ':Telescope project<CR>', {})
        end,
    },

    -- Telescope - file--browser
    {
        "nvim-telescope/telescope-file-browser.nvim",
        dependencies = { "nvim-telescope/telescope.nvim" },
        config = function()
            require("telescope").setup({
                extensions = {
                    file_browser = {
                        -- theme = "ivy",   -- Use a dropdown theme
                        hijack_netrw = true,  -- Take over netrw (default file explorer)
                        hidden = true,        -- Show hidden files
                        respect_gitignore = true, -- Respect .gitignore
                    },
                },
            })
            require("telescope").load_extension("file_browser")

            -- Keybinding to open the file browser
            vim.keymap.set('n', '<leader>bf', function()
                require("telescope").extensions.file_browser.file_browser()
            end, { desc = "Open file browser" })
        end,
    }
}
