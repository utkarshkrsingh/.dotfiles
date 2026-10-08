local treesitter = require("nvim-treesitter")

local ensure_installed = {
    "javascript",
	"typescript",
	"tsx",
    "vue",
	"html",
	"css",
	"python",
	"http",
	"markdown",
	"markdown_inline",
	"bash",
	"lua",
	"vim",
	"dockerfile",
	"gitignore",
	"vimdoc",
	"c",
	"cpp",
	"go",
    "sql",
    "elixir",
    "rust",
}

treesitter.install(ensure_installed)

vim.api.nvim_create_autocmd("FileType", {
    pattern = "*",
    callback = function(args)
        local buf = args.buf
        local ft = vim.bo[buf].filetype
        -- enable indentation only for real languages
        if ft ~= "yaml" and ft ~= "markdown" then
            vim.bo[buf].indentexpr = "v:lua.require'nvim-treesitter'.indentexpr()"
            vim.bo[buf].smartindent = false
            vim.bo[buf].cindent = false
        end

        local lang = vim.treesitter.language.get_lang(ft)

        if not lang then
            return
        end

        -- load parser safely
        local ok_add = pcall(vim.treesitter.language.add, lang)
        if not ok_add then
            return
        end

        -- start treesitter safely
        pcall(vim.treesitter.start, buf, lang)
    end,
})

require("nvim-ts-autotag").setup({
    opts = {
        enable_close = true,           -- Auto-close tags
        enable_rename = true,          -- Auto-rename pairs
        enable_close_on_slash = false, -- Disable auto-close on trailing `</`
    },
    per_filetype = {
        ["html"] = {
            enable_close = true, -- Disable auto-closing for HTML
        },
        ["typescriptreact"] = {
            enable_close = true, -- Explicitly enable auto-closing (defaults to true)
        },
    },
})
