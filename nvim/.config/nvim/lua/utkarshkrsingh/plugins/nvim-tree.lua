local nvimtree = require("nvim-tree")

nvimtree.setup({
    sync_root_with_cwd = true,
    respect_buf_cwd = true,

    view = {
        width = 30,
    },

    filters = {
        dotfiles = false,
        git_ignored = false,
    },

    renderer = {
        indent_markers = {
            enable = true,
        },

        icons = {
            glyphs = {
                default = "",

                folder = {
                    arrow_closed = "▸",
                    arrow_open = "▾",
                    default = "",
                    open = "",
                },
            },
        },
    },

    actions = {
        open_file = {
            resize_window = true,
        },
    },
})

-- Smart toggle
vim.keymap.set("n", "<leader>o", function()
    local api = require("nvim-tree.api")

    if api.tree.is_visible() then
        if vim.bo.filetype == "NvimTree" then
            api.tree.close()
        else
            api.tree.focus()
        end
    else
        api.tree.open()
        api.tree.find_file({
            open = true,
            focus = true,
        })
    end
end, {
    desc = "NvimTree smart toggle",
    silent = true,
})
