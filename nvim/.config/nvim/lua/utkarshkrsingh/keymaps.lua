local function map(mode, lhs, rhs)
    vim.keymap.set(mode, lhs, rhs, { silent = true })
end

-- Function to create a new file
function CreateFile()
    -- Prompt for the filename
    local filename = vim.fn.input("Enter filename: ")
    if filename ~= "" then
        -- Create the file
        vim.cmd("edit " .. filename)
        print("File created: " .. filename)
    else
        print("No filename provided. File not created.")
    end
end

-- Function to delete the current file
function DeleteFile()
    -- Get the current file path
    local filepath = vim.fn.expand("%:p")
    if filepath ~= "" then
        -- Confirm deletion
        local confirm = vim.fn.input("Are you sure you want to delete " .. filepath .. "? (y/n): ")
        if confirm == "y" then
            -- Delete the file
            os.remove(filepath)
            vim.cmd("bd!") -- Close the buffer
            print("File deleted: " .. filepath)
        else
            print("File not deleted.")
        end
    else
        print("No file is open.")
    end
end

-- Function to rename the current file
function RenameFile()
    -- Get the current file path
    local old_filepath = vim.fn.expand("%:p")
    if old_filepath == "" then
        print("No file is open.")
        return
    end

    -- Prompt for the new filename
    local new_filename = vim.fn.input("Enter new filename: ", vim.fn.expand("%:t"))
    if new_filename == "" then
        print("No filename provided. File not renamed.")
        return
    end

    -- Construct the new file path
    local new_filepath = vim.fn.expand("%:p:h") .. "/" .. new_filename

    -- Rename the file
    local success, err = os.rename(old_filepath, new_filepath)
    if not success then
        print("Error renaming file: " .. err)
        return
    end

    -- Reopen the file with the new name
    vim.cmd("edit " .. new_filepath)
    print("File renamed to: " .. new_filepath)
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

-- Change Window
map("n", "<space>.", "<CMD>:bn<CR>") -- next window 
map("n", "<space>,", "<CMD>:bp<CR>") -- prev window
map("n", "<space>/", "<CMD>:bdelete | bnext<CR>") -- close window
map("n", "<space>/f", "<CMD>:bdelete! | bnext<CR>") -- close window - force - for terminal

-- Lazy.nvim
map("n", "<space><space>", "<CMD>Lazy<CR>")

-- Map the function to a keybinding (e.g., <leader>cf)
vim.api.nvim_set_keymap('n', '<space>cf', ':lua CreateFile()<CR>', { noremap = true, silent = true })

-- Map the function to a keybinding (e.g., <leader>df)
vim.api.nvim_set_keymap('n', '<space>df', ':lua DeleteFile()<CR>', { noremap = true, silent = true })

-- Map the function to a keybinding (e.g., <leader>rf)
vim.api.nvim_set_keymap('n', '<space>rf', ':lua RenameFile()<CR>', { noremap = true, silent = true })
