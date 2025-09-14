return {
    {
        "rcarriga/nvim-dap-ui",
        event = "VeryLazy",
        dependencies = {
            "mfussenegger/nvim-dap",
        },
        config = function()
            local dap = require("dap")
            local dapui = require("dapui")
            dapui.setup()
            dap.listeners.after.event_initialized["dapui_config"] = function()
                dapui.open()
            end
            dap.listeners.before.event_terminated["dapui_config"] = function()
                dapui.close()
            end
            dap.listeners.before.event_exited["dapui_config"] = function()
                dapui.close()
            end
        end,
    },
    {
        "jay-babu/mason-nvim-dap.nvim",
        event = "VeryLazy",
        dependencies = {
            "williamboman/mason.nvim",
            "mfussenegger/nvim-dap",
        },
        opts = {
            ensure_installed = { "codelldb" }, -- auto install codelldb
            handlers = {},
        },
    },
    {
        "mfussenegger/nvim-dap",
        config = function(_, _)
            local ok, dap = pcall(require, "dap")
            if not ok then
                return
            end

            -- Keymaps
            vim.keymap.set("n", "<F5>", dap.continue, { desc = "DAP Continue" })
            vim.keymap.set("n", "<F10>", dap.step_over, { desc = "DAP Step Over" })
            vim.keymap.set("n", "<F11>", dap.step_into, { desc = "DAP Step Into" })
            vim.keymap.set("n", "<F12>", dap.step_out, { desc = "DAP Step Out" })
            vim.keymap.set("n", "<F9>", dap.toggle_breakpoint, { desc = "DAP Toggle Breakpoint" })

            -- Setup codelldb adapter
            local mason_path = vim.fn.stdpath("data") .. "/mason"
            local codelldb_path = mason_path .. "/bin/codelldb"

            dap.adapters.codelldb = {
                type = "server",
                port = "${port}",
                executable = {
                    command = codelldb_path,
                    args = { "--port", "${port}" },
                },
            }

            dap.configurations.cpp = {
                {
                    name = "Launch file",
                    type = "codelldb",
                    request = "launch",
                    program = function()
                        return vim.fn.input("Path to executable: ", vim.fn.getcwd() .. "/", "file")
                    end,
                    cwd = "${workspaceFolder}",
                    stopOnEntry = false,
                    args = {},
                },
            }

            -- Reuse for C and Rust
            dap.configurations.c = dap.configurations.cpp
            dap.configurations.rust = dap.configurations.cpp
        end,
    },
}
