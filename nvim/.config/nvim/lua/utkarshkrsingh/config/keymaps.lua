-- ~/.config/nvim/lua/utkarshkrsingh/config/keymaps.lua
local map = vim.keymap.set
local opts = function(desc)
    return { noremap = true, silent = true, desc = desc }
end

-- Saving and exiting
map("n", "<leader>w", "<cmd>w<CR>", opts("Save file"))
map("n", "<leader>q", "<cmd>q<CR>", opts("Quit"))
map("n", "<leader>wq", "<cmd>wq<CR>", opts("Save and quit"))

-- Buffer navigation and closing
map("n", "<Space>.", "<cmd>bnext<CR>", opts("Next buffer"))
map("n", "<Space>,", "<cmd>bprev<CR>", opts("Prev buffer"))
map("n", "<Space>/", "<cmd>bnext<CR><cmd>bdelete #<CR>", opts("Close buffer"))

-- Splitting
map("n", "<Space>s", "<cmd>vsplit<CR>", opts("Vertical split"))
map("n", "<Space>h", "<cmd>split<CR>", opts("Horizontal split"))
