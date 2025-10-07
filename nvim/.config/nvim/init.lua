-- ~/.config/nvim/init.lua

-- Set leader key
vim.g.mapleader = ","

-- Load core configs
require("utkarshkrsingh.config.options")
require("utkarshkrsingh.config.keymaps")


-- Bootstrap Lazy.nvim
local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
if not vim.loop.fs_stat(lazypath) then
	vim.fn.system({
		"git", "clone", "--filter=blob:none",
		"https://github.com/folke/lazy.nvim.git", "--branch=stable", lazypath
	})
end
vim.opt.rtp:prepend(lazypath)

require("lazy").setup("utkarshkrsingh.plugins")

vim.cmd.colorscheme("tokyonight-night")
