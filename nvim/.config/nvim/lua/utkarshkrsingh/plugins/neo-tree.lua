require("nvim-web-devicons").setup()

require("neo-tree").setup({
    close_if_last_window = true,

    filesystem = {
        bind_to_cwd = true,

        cwd_target = {
            sidebar = "global",
            current = "global",
        },

        follow_current_file = {
            enabled = true,
            leave_dirs_open = false,
        },

        filtered_items = {
            hide_dotfiles = false,
            hide_gitignored = false,
        },

        hijack_netrw_behavior = "open_current",
    },

    window = {
        width = 30,
    },

    default_component_configs = {
        indent = {
            with_markers = true,
            expander_collapsed = "▸",
            expander_expanded = "▾",
        },
    },
})

-- Smart toggle
local manager = require("neo-tree.sources.manager")
local command = require("neo-tree.command")

vim.keymap.set("n", "<leader>o", function()
    local state = manager.get_state("filesystem")

    if state and state.winid and vim.api.nvim_win_is_valid(state.winid) then
        if vim.bo.filetype == "neo-tree" then
            command.execute({ action = "close" })
        else
            vim.api.nvim_set_current_win(state.winid)
        end
        return
    end

    local root = vim.fs.root(0, {
        -- ".git",
        ".hg", ".svn",
        "go.work", "go.mod",
        "Cargo.toml",
        "package.json", "pnpm-workspace.yaml",
        "deno.json", "deno.jsonc",
        "pyproject.toml", "uv.lock", "poetry.lock", "Pipfile",
        "pom.xml", "settings.gradle", "settings.gradle.kts",
        "build.gradle", "build.gradle.kts", "gradlew",
        "CMakeLists.txt", "compile_commands.json", "Makefile",
        "build.zig",
        "Package.swift",
        "pubspec.yaml",
        "composer.json",
        "Gemfile",
        "mix.exs",
        "stack.yaml",
        "cabal.project",
        "dune-project",
        "flake.nix",
        "WORKSPACE",
        "MODULE.bazel",
        ".devcontainer",
    }) or vim.fn.getcwd()

    command.execute({
        source = "filesystem",
        action = "focus",
        dir = root,
        reveal = true,
    })
end, {
    desc = "Neo-tree smart toggle",
    silent = true,
})
