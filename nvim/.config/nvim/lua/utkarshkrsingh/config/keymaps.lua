-- ~/.config/nvim/lua/utkarshkrsingh/config/keymaps.lua
local primaryKey = " "

-- Saving and exiting
vim.keymap.set("n", "<leader>w", ":w<CR>", { noremap = true, silent = true })
vim.keymap.set("n", "<leader>q", ":q<CR>", { noremap = true, silent = true })
vim.keymap.set("n", "<leader>wq", ":wq<CR>", { noremap = true, silent = true })

-- Buffer navigation and closing
vim.keymap.set("n", primaryKey .. ".", ":bnext<CR>", { noremap = true, silent = true })
vim.keymap.set("n", primaryKey .. ",", ":bprev<CR>", { noremap = true, silent = true })
vim.keymap.set("n", primaryKey .. "/", ":bnext | bdelete #<CR>", { noremap = true, silent = true })

-- Spliting buffer
vim.keymap.set('n', primaryKey .. 's', ":vsplit<CR>", { noremap = true, silent = true })
vim.keymap.set('n', primaryKey .. 'vs', ":split<CR>", { noremap = true, silent = true })

-- Terminal Keymap
vim.keymap.set('n', primaryKey .. 'st', function()
    vim.cmd.vnew()
    vim.cmd.term()
    vim.cmd.wincmd("J")
    vim.api.nvim_win_set_height(0, 15)
end)
