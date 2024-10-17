local function map(mode, lhs, rhs)
    vim.keymap.set(mode, lhs, rhs, { silent = true })
end

-- Split
map("n", "<leader>s", "<CMD>split<CR>")     -- horizontal split
map("n", "<leader>vs", "<CMD>vsplit<CR>")   -- vertical split

-- Terminal
map("n", "<leader>t", "<CMD>terminal<CR>")

-- Exit terminal
map("t", "<Esc>", "<C-\\><C-n>")

-- Save
map("n", "<leader>w", "<CMD>update<CR>")

-- Quit
map("n", "<leader>q", "<CMD>q<CR>")

-- Save & Quit
map("n", "<leader>wq", "<CMD>wq<CR>")

-- Window Navigation
map("n", "<C-h>", "<C-w>h") -- move left
map("n", "<C-l>", "<C-w>l") -- move right
map("n", "<C-k>", "<C-w>k") -- move above
map("n", "<C-j>", "<C-w>j") -- move belowe

-- Resize Windows
map("n", "<C-Left>", "<C-w><")
map("n", "<C-Right>", "<C-w>>")
map("n", "<C-Up>", "<C-w>+")
map("n", "<C-Down>", "<C-w>-")

-- Lazy.nvim
map("n", "<space><space>", "<CMD>Lazy<CR>")
