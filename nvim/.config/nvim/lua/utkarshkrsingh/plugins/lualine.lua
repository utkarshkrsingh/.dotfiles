-- ~/.config/nvim/lua/utkarshkrsingh/plugins/lualine.lua

return {
    {
        "nvim-lualine/lualine.nvim",
        dependencies = {
            "nvim-tree/nvim-web-devicons"
        },
        config = function()
            require('lualine').setup({
                options = {
                    theme = 'tokyonight-night',
                    section_separators = { '', '' },
                    component_separators = { '', '' },
                    icons_enabled = true,
                    globalstatus = true,
                },
                sections = {
                    lualine_a = { 'mode' },
                    lualine_b = { 'branch', 'diff', 'diagnostics' },
                    lualine_c = { 'filename' },
                    lualine_x = { 'encoding', 'fileformat', 'filetype' },
                    lualine_y = { 'progress' },
                    lualine_z = { 'location' }
                },
                inactive_sections = {
                    lualine_a = {},
                    lualine_b = {},
                    lualine_c = { 'filename' },
                    lualine_x = { 'location' },
                    lualine_y = {},
                    lualine_z = {}
                },
            })

            -- Make lualine transparent
            for _, mode in ipairs({ "normal", "insert", "visual", "replace", "command", "inactive" }) do
                for _, section in ipairs({ "a", "b", "c", "x", "y", "z" }) do
                    vim.api.nvim_set_hl(0, "lualine_" .. section .. "_" .. mode, { bg = "none" })
                end
            end
        end
    }
}
