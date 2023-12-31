require("nyxfr.settings")
require("nyxfr.plugins")
require("nyxfr.maps")

-- colorscheme config: kanagawa
local themeStatus, catppuccin = pcall(require, "catppuccin")

if themeStatus then
    vim.cmd("colorscheme catppuccin")
else
    return
end
