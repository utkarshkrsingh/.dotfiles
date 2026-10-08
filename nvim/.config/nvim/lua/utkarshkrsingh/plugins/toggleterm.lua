local toggleterm = require("toggleterm")

toggleterm.setup({
    size = 20,
    open_mapping = [[<leader>t]],
    hide_number = true,
    shade_terminals = true,
    shading_factor = 2,
    start_in_insert = true,
    insert_mappings = true,
    terminal_mappings = true,
    persist_size = true,
    direction = "horizontal", -- can be 'float' or 'vertical'
    close_on_exit = true,
    shell = vim.o.shell,
})
