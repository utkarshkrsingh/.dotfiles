return {
    "romgrk/barbar.nvim",
    config = function()
        vim.g.barbar_auto_setup = false
        require("barbar").setup({
            sidebar_filetypes = {
                ["neo-tree"] = { event = "BufWipeout" },
            },
        })

        -- Keymaps
        -- Move to previous/next
        vim.keymap.set("n", "<space>,", "<Cmd>BufferPrevious<CR>", opts)
        vim.keymap.set("n", "<space>.", "<Cmd>BufferNext<CR>", opts)
        vim.keymap.set('n', '<space>/', '<Cmd>BufferClose<CR>', opts)
    end,
}
