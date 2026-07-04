require("nvim-web-devicons").setup({
    override = {
        dashboard = {
            icon = "",
            color = "#569CD6",
            name = "Dashboard",
        },
    },
})

require("dashboard").setup({
    theme = "hyper",

    config = {
        week_header = {
            enable = false,
        },

        shortcut = {
            {
                desc = "󰊳  Update",
                group = "@property",

                -- Lazy update -> replace with your vim.pack update command
                action = "PackUpdate",

                key = "u",
            },

            {
                desc = "  GitHub",
                group = "Label",

                action = function()
                    local url = "https://github.com/utkarshkrsingh"

                    if vim.fn.has("macunix") == 1 then
                        vim.fn.jobstart({ "open", url }, { detach = true })

                    elseif vim.fn.has("unix") == 1 then
                        vim.fn.jobstart({ "xdg-open", url }, { detach = true })

                    elseif vim.fn.has("win32") == 1 then
                        vim.fn.jobstart(
                            { "cmd", "/c", "start", url },
                            { detach = true }
                        )

                    else
                        vim.notify(
                            "Unsupported platform for opening browser",
                            vim.log.levels.WARN
                        )
                    end
                end,

                key = "g",
            },

            {
                desc = "  @utkarshkrsingh",
                group = "Label",
            },
        },

        header = {
            "",
            "  █▄░█ █▀▀ █▀█ █░█ █ █▀▄▀█",
            "  █░▀█ ██▄ █▄█ ▀▄▀ █ █░▀░█",
            "",
        },
    },

    footer = {
        "",
        "🚀 Happy hacking with Neovim",
    },
})
