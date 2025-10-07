-- ~/.config/nvim/lua/utkarshkrsingh/plugins/treesitter.lua
return {
    "nvim-treesitter/nvim-treesitter",
    run = ":TSUpdate",
    config = function()
        require("nvim-treesitter.configs").setup({
            ensure_installed = { "lua", "c", "cpp", "go", "javascript", "typescript", "html", "css" },
            highlight = {
                enable = true,
                additional_vim_regex_highlighting = false,
            },
        })
    end
}
