return {
    "nvim-lualine/lualine.nvim",
    config = function()
        require("lualine").setup({
            options = {
                theme = "tokyonight-night",
                component_separators = { left = "", right = "" },
                section_separators = { left = "", right = "" },
            },
            sections = {
                lualine_a = { "mode" },
                lualine_b = { "branch", "diff", "diagnostics" },
                lualine_c = { "hostname" }, -- put "filename" for filename in {}
                lualine_x = { "encoding", "fileformat", "filetype" },
                lualine_y = { "progress" },
                lualine_z = { "location" },
            },
            tabline = {
                lualine_a = {
                    {
                        "buffers",
                        show_filename_only = true, -- Shows shortened relative path when set to false.
                        hide_filename_extension = false, -- Hide filename extension when set to true.
                        show_modified_status = true, -- Shows indicator when the buffer is modified.

                        mode = 2, -- 0: Shows buffer name
                        -- 1: Shows buffer index
                        -- 2: Shows buffer name + buffer index
                        -- 3: Shows buffer number
                        -- 4: Shows buffer name + buffer number

                        max_length = vim.o.columns * 2 / 3, -- Maximum width of buffers component,
                        filetype_names = {
                            TelescopePrompt = "Telescope",
                            dashboard = "Dashboard",
                            fzf = "FZF",
                            alpha = "Alpha",
                        }, -- Shows specific buffer name for that filetype ( { `filetype` = `buffer_name`, ... } )
                    },
                },
                lualine_b = {},
                lualine_c = {},
                lualine_x = {},
                lualine_y = {},
                lualine_z = { "tabs" },
            },
            extensions = { "fugitive", "nvim-tree" },
        })
    end,
}
