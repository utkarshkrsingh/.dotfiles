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
