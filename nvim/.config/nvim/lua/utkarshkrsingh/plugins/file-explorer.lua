-- ~/.config/nvim/lua/utkarshkrsingh/plugins/file-explorer.lua
return {
    'nvim-tree/nvim-tree.lua',
    dependencies = {
        'nvim-tree/nvim-web-devicons',
    },
    keys = {
        { '<leader>e', '<cmd>NvimTreeToggle<CR>',   desc = 'Explorer: Toggle file tree' },
        -- { '<leader>fe', '<cmd>NvimTreeFindFile<CR>', desc = 'Explorer: Find current file' },
        { '<leader>o', '<cmd>NvimTreeFocus<CR>',    desc = 'Explorer: Focus file tree' },
        { ' q',        '<cmd>NvimTreeFindFile<CR>', desc = 'Explorer: Find files in file tree' }
    },
    config = function()
        -- Disable netrw (strongly advised by nvim-tree)
        vim.g.loaded_netrw = 1
        vim.g.loaded_netrwPlugin = 1

        require('nvim-tree').setup({
            sort_by = 'case_sensitive',
            view = {
                width = 30,
                side = 'left',
            },
            renderer = {
                group_empty = true,
                icons = {
                    glyphs = {
                        default = '',
                        symlink = '',
                        folder = {
                            arrow_open = '󱞡',
                            arrow_closed = '󱞩',
                            default = '',
                            open = '',
                            empty = '󰉖',
                            empty_open = '',
                            symlink = '',
                            symlink_open = '',
                        },
                        git = {
                            unstaged = '',
                            staged = '',
                            unmerged = '',
                            renamed = '➜',
                            untracked = '',
                            deleted = '',
                            ignored = '',
                        },
                    },
                },
            },
            filters = {
                dotfiles = false,
            },
            actions = {
                open_file = {
                    quit_on_open = false,
                },
            },
        })
    end,
}
