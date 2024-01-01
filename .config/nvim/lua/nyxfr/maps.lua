local function map(mode, lhs, rhs)
    vim.keymap.set(mode, lhs, rhs, { silent = true })
end

-- Split 
map("n", "<leader>s", "<CMD>split<CR>")
map("n", "<leader>vs", "<CMD>vsplit<CR>")

-- Terminal
map("n", "<leader>t", "<CMD>terminal<CR>")

-- Save
map("n", "<leader>w", "<CMD>update<CR>")

-- Quit
map("n", "<leader>q", "<CMD>q<CR>")

-- Save & Quit
map("n", "<leader>wq", "<CMD>wq<CR>")

-- Telescope
local builtin = require('telescope.builtin')
map("n", "<leader>ff", builtin.find_files, {})
map("n", "<leader>fg", builtin.live_grep, {})
map('n', '<leader>fb', builtin.buffers, {})
map('n', '<leader>fh', builtin.help_tags, {})

-- Windows
map("n", "<leader>ñ", "<CMD>vsplit<CR>")
map("n", "<leader>p", "<CMD>split<CR>")

-- NeoTree
map("n", "<leader>e", "<CMD>Neotree toggle<CR>")
map("n", "<leader>o", "<CMD>Neotree focus<CR>")

-- Buffer
map("n", "<TAB>", "<CMD>bnext<CR>")
map("n", "<S-TAB>", "<CMD>bprevious<CR>")

-- Terminal
map("n", "<leader>th", "<CMD>ToggleTerm size=10 direction=horizontal<CR>")
map("n", "<leader>tv", "<CMD>ToggleTerm size=80 direction=vertical<CR>")

-- Markdown Preview
map("n", "<leader>m", "<CMD>MarkdownPreview<CR>")
map("n", "<leader>mn", "<CMD>MarkdownPreviewStop<CR>")

-- Window Navigation
map("n", "<C-h>", "<C-w>h")
map("n", "<C-l>", "<C-w>l")
map("n", "<C-k>", "<C-w>k")
map("n", "<C-j>", "<C-w>j")

-- Resize Windows
map("n", "<C-Left>", "<C-w><")
map("n", "<C-Right>", "<C-w>>")
map("n", "<C-Up>", "<C-w>+")
map("n", "<C-Down>", "<C-w>-")
