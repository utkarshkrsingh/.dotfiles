-- ~/.config/nvim/lua/utkarshkrsingh/plugins/treesitter.lua
return {
    "romus204/tree-sitter-manager.nvim",
    lazy = false,
    config = function()
        require("tree-sitter-manager").setup({
            -- ensure_installed = {
            --     "lua", "c", "cpp", "go",
            --     "javascript", "typescript",
            --     "html", "css",
            --     "markdown",
            -- },
            auto_install = true,
            highlight = true,
            border = "rounded",
        })
    end,
}
