-- NOTE: pack hooks early autocmds

vim.api.nvim_create_autocmd("PackChanged", {
    callback = function(ev)
        local spec = ev.data.spec
        if not spec or spec.name ~= "nvim-treesitter" then
            return
        end

        local kind = ev.data.kind
        if kind ~= "install" and kind ~= "update" then
            return
        end

        if not ev.data.active then
            vim.cmd("packadd nvim-treesitter")
        end

        vim.cmd("TSUpdate")
    end,
})
