return {
  "nvim-neo-tree/neo-tree.nvim",
  branch = "v3.x",
  dependencies = {
    "nvim-lua/plenary.nvim",
    "nvim-tree/nvim-web-devicons", -- optional, for file icons
    "MunifTanjim/nui.nvim",
  },
  config = function()
    require("neo-tree").setup({
      close_if_last_window = true, -- closes neo-tree if it's the last window
      popup_border_style = "rounded",
      enable_git_status = true,
      enable_diagnostics = true,
      default_component_configs = {
        indent = {
          with_markers = true,
          indent_size = 2,
          padding = 1,
        },
        icon = {
          folder_closed = "",
          folder_open = "",
          folder_empty = "",
        },
        git_status = {
          symbols = {
            added = "✚",
            modified = "",
            deleted = "✖",
            renamed = "󰑕",
            untracked = "",
            ignored = "",
            unstaged = "",
            staged = "",
            conflict = "",
          },
        },
      },
      window = {
        position = "left",
        width = 30,
        mappings = {
          ["<space>"] = "toggle_node",
          ["<cr>"] = "open",
          ["S"] = "open_split",
          ["s"] = "open_vsplit",
          ["C"] = "close_node",
          ["z"] = "close_all_nodes",
          ["R"] = "refresh",
          ["a"] = "add",
          ["A"] = "add_directory",
          ["d"] = "delete",
          ["r"] = "rename",
          ["y"] = "copy_to_clipboard",
          ["x"] = "cut_to_clipboard",
          ["p"] = "paste_from_clipboard",
          ["q"] = "close_window",
          ["?"] = "show_help",
        },
      },
      filesystem = {
        follow_current_file = {
          enabled = true, -- expands the tree to the current file
        },
        filtered_items = {
          visible = true,  -- <--- this shows hidden files
          hide_dotfiles = false,  -- <--- dotfiles will now be visible
          hide_gitignored = false, -- <--- gitignored files will also be shown
          hide_by_name = {
            "node_modules",
          },
          never_show = {
            ".DS_Store",
            "thumbs.db",
          },
        },
      },
      buffers = {
        follow_current_file = {
          enabled = true,
        },
      },
      git_status = {
        window = {
          position = "float",
        },
      },
    })

    -- Keymap to toggle NeoTree
    vim.keymap.set("n", "<leader>e", "<cmd>Neotree toggle<CR>", { desc = "Toggle NeoTree" })
  end,
}
