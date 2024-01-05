return {
    'windwp/nvim-autopairs',
    event = "InsertEnter",
    opts = {},
    config = function()
        require('nvim-autopairs').setup({
            disable_filetype = { "TelescopePrompt" , "vim" },
        })
    end
}
