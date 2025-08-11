-- Keymaps are automatically loaded on the VeryLazy event
-- Default keymaps that are always set: https://github.com/LazyVim/LazyVim/blob/main/lua/lazyvim/config/keymaps.lua
-- Add any additional keymaps here
local primaryKey = ","

-- Saving and exiting
vim.keymap.set("n", primaryKey .. "w", ":w<CR>", { noremap = true, silent = true })
vim.keymap.set("n", primaryKey .. "q", ":q<CR>", { noremap = true, silent = true })
vim.keymap.set("n", primaryKey .. "wq", ":wq<CR>", { noremap = true, silent = true })

-- Neo-tree navigation
vim.keymap.set("n", primaryKey .. "e", ":Neotree toggle<CR>", { noremap = true, silent = true })
vim.keymap.set("n", primaryKey .. "o", ":Neotree focus <CR>", { noremap = true, silent = true })

-- Buffer navigation and closing
vim.keymap.set("n", "<leader>.", ":bnext<CR>", { noremap = true, silent = true })
vim.keymap.set("n", "<leader>,", ":bprev<CR>", { noremap = true, silent = true })
vim.keymap.set("n", "<leader>/", ":bnext | bdelete #<CR>", { noremap = true, silent = true })
