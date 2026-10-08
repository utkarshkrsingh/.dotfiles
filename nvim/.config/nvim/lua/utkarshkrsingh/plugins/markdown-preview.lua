vim.g.mkdp_filetypes = { "markdown" }

vim.api.nvim_create_autocmd("FileType", {
  pattern = "markdown",
  callback = function()
    -- Load the plugin only for markdown files if desired
    vim.cmd.packloadall()
  end,
})
