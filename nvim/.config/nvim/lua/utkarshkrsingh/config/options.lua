-- ~/.config/nvim/lua/utkarshkrsingh/config/options.lua
local o = vim.opt

-- Editor Options
o.number = true
o.relativenumber = true
o.clipboard = "unnamedplus"
o.autoindent = true
o.cursorline = true
o.shiftwidth = 2
o.tabstop = 2
o.softtabstop = 2
o.expandtab = true
o.fileencoding = "utf-8"
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
o.scrolloff = 8
o.signcolumn = "yes"
o.updatetime = 300
o.wrap = false

o.foldenable = true
o.foldmethod = "manual"
o.foldlevel = 99
o.foldcolumn = "0"

vim.cmd("syntax on")
o.winborder = "rounded"
