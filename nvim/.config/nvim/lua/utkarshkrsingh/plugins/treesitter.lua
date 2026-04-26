-- ~/.config/nvim/lua/utkarshkrsingh/plugins/treesitter.lua
return {
  {
    "nvim-treesitter/nvim-treesitter",
    build = ":TSUpdate",
    event = { "BufReadPost", "BufNewFile" },
    config = function()
      local treesitter = require("nvim-treesitter")

      local ensure_installed = {
        "javascript", "typescript", "tsx", "html", "css",
        "python", "http", "markdown", "markdown_inline",
        "bash", "lua", "vim", "dockerfile", "gitignore",
        "vimdoc", "c", "cpp",
      }

      -- install parsers (new API)
      treesitter.install(ensure_installed)

      -- your custom runtime setup
      vim.api.nvim_create_autocmd("FileType", {
        pattern = "*",
        callback = function(args)
          local buf = args.buf
          local ft = vim.bo[buf].filetype
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

          -- enable indentation only for real languages
          if ft ~= "yaml" and ft ~= "markdown" then
            vim.bo[buf].indentexpr =
              "v:lua.require'nvim-treesitter'.indentexpr()"
            vim.bo[buf].smartindent = false
            vim.bo[buf].cindent = false
          end
        end,
      })
    end,
  },

  {
    "windwp/nvim-ts-autotag",
    event = "InsertEnter",
    config = function()
      require("nvim-ts-autotag").setup({
        opts = {
          enable_close = true,
          enable_rename = true,
          enable_close_on_slash = false,
        },
        per_filetype = {
          html = {
            enable_close = true,
          },
          typescriptreact = {
            enable_close = true,
          },
        },
      })
    end,
  },
}
