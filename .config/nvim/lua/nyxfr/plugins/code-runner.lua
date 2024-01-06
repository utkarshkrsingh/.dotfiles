return {
    "CRAG666/code_runner.nvim",
    config = function()
        require("code_runner").setup({
            filetype = {
                java = {
                    "cd $dir &&",
                    "javac $fileName &&",
                    "java $fileNameWithoutExt",
                },
                python = "python -u",
                rust = {
                    "cd $dir &&",
                    "rustc $fileName &&",
                    "$dir/$fileNameWithoutExt",
                },
            },
        })

        -- Keymaps
        vim.keymap.set("n", "<space>r", ":RunCode<CR>", { noremap = true, silent = false })
        vim.keymap.set("n", "<space>rf", ":RunFile<CR>", { noremap = true, silent = false })
        vim.keymap.set("n", "<space>rft", ":RunFile tab<CR>", { noremap = true, silent = false })
        vim.keymap.set("n", "<space>rp", ":RunProject<CR>", { noremap = true, silent = false })
        vim.keymap.set("n", "<space>rc", ":RunClose<CR>", { noremap = true, silent = false })
    end,
}
