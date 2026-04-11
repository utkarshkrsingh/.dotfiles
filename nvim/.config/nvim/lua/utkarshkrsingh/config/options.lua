-- ~/.config/nvim/lua/utkarshkrsingh/config/options.lua

local o = vim.opt

-- Editor Options
o.number = true
o.relativenumber = true
o.clipboard = "unnamedplus"
o.syntax = "on"
o.autoindent = true
o.cursorline = true
o.shiftwidth = 4
o.tabstop = 4
o.softtabstop = 4
o.expandtab = true
o.encoding = "UTF-8"
o.ruler = true
o.mouse = "a"
o.title = true
o.hidden = true
o.ttimeoutlen = 0
o.wildmenu = true
o.showcmd = true
o.showmatch = true
o.inccommand = "split"
o.splitright = true
o.splitbelow = true
o.termguicolors = true

-- -- Terminal Auto-Command
local term_buf = nil
local prev_buf = nil

-- Toggle terminal
vim.keymap.set('n', '<leader>t', function()
    prev_buf = vim.api.nvim_get_current_buf()

    -- If terminal exists and is valid → go to it
    if term_buf and vim.api.nvim_buf_is_valid(term_buf) then
        vim.api.nvim_set_current_buf(term_buf)
    else
        -- Create new terminal
        vim.cmd('tabnew') -- or 'vnew' if you prefer split
        vim.cmd('term')
        term_buf = vim.api.nvim_get_current_buf()
    end

    -- Enter insert mode
    vim.cmd('startinsert')
end)

-- Exit terminal mode and return to previous buffer
vim.keymap.set('t', '<Esc>', function()
    vim.cmd('stopinsert')

    if prev_buf and vim.api.nvim_buf_is_valid(prev_buf) then
        vim.api.nvim_set_current_buf(prev_buf)
    end
end)
