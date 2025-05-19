return {
    "stevearc/conform.nvim",
    event = { "BufReadPre", "BufNewFile" },
    config = function()
        local conform = require("conform")

        -- Define formatters for each file type
        local formatters_by_ft = {
            javascript = { "prettier" },
            typescript = { "prettier" },
            javascriptreact = { "prettier" },
            typescriptreact = { "prettier" },
            css = { "prettier" },
            html = { "prettier" },
            json = { "prettier" },
            yaml = { "prettier" },
            markdown = { "prettier" },
            lua = { "stylua" },
            python = { "isort", "black" },
			go = {"gofmt"},
        }

        -- Filter out unavailable formatters
        for ft, formatters in pairs(formatters_by_ft) do
            formatters_by_ft[ft] = vim.tbl_filter(function(formatter)
                return conform.formatters[formatter] and vim.fn.executable(formatter) == 1
            end, formatters)
        end

        -- Setup conform.nvim
        conform.setup({
            formatters_by_ft = formatters_by_ft,
            format_on_save = {
                lsp_fallback = true,
                async = false,
                timeout_ms = 1000,
            },
            formatters = {
                prettier = {
                    args = { "--tab-width", "4", "--use-tabs", "false" },
                },
                stylua = {
                    args = { "--indent-width", "4", "--indent-type", "Spaces" },
                },
                black = {
                    args = { "--line-length", "88" },
                },
                isort = {
                    args = { "--profile", "black" },
                },
				gofmt = {
				    prepend_args = { "-s" },
				},
            },
        })

        -- Keymap for formatting
        vim.keymap.set({ "n", "v" }, "<leader>f", function()
            conform.format({
                lsp_fallback = true,
                async = false,
                timeout_ms = 1000,
            })
        end, { desc = "Format file or range (in visual mode)" })
    end,
}
