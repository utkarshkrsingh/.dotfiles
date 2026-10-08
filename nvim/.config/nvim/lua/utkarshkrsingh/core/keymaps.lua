local opts = function(desc)
	return { noremap = true, silent = true, desc = desc }
end

vim.g.mapleader = ","

-- moving half page up and down
vim.keymap.set('n', '<C-d>', '<C-d>zz', opts("Moving half page down with auto-center"))
vim.keymap.set('n', '<C-u>', '<C-u>zz', opts("Moving half page up with auto-center"))

-- Saving and exiting
vim.keymap.set("n", "<leader>w", "<cmd>w<CR>", opts("Save file"))
vim.keymap.set("n", "<leader>q", "<cmd>q<CR>", opts("Quit"))
vim.keymap.set("n", "<leader>wq", "<cmd>wq<CR>", opts("Save and quit"))

-- Buffer navigation and closing
vim.keymap.set("n", "<Space>.", "<cmd>bnext<CR>", opts("Next buffer"))
vim.keymap.set("n", "<Space>,", "<cmd>bprev<CR>", opts("Prev buffer"))
vim.keymap.set("n", "<Space>/", "<cmd>bnext<CR><cmd>bdelete #<CR>", opts("Close buffer"))

-- Splitting
vim.keymap.set("n", "<Space>s", "<cmd>vsplit<CR>", opts("Vertical split"))
vim.keymap.set("n", "<Space>h", "<cmd>split<CR>", opts("Horizontal split"))
vim.keymap.set("n", "<Space>q", "<C-w>c<CR>", opts("Horizontal split"))

-- Exit terminal mode with <Esc>
vim.keymap.set("t", "<Esc>", [[<C-\><C-n>]], { noremap = true, silent = true })

-- Lazygit
vim.keymap.set("n", "<leader>lg", "<cmd>LazyGit<CR>", opts("Open LazyGit"))
