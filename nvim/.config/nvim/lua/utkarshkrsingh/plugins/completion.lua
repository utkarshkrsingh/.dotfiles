local cmp = require("cmp")
local luasnip = require("luasnip")
local lspkind = require("lspkind")

-- VSCode snippets
require("luasnip.loaders.from_vscode").lazy_load()

luasnip.config.setup({
    history = true,
    updateevents = "TextChanged,TextChangedI",
})

cmp.setup({
    snippet = {
        expand = function(args)
            luasnip.lsp_expand(args.body)
        end,
    },

    mapping = cmp.mapping.preset.insert({
        ["<Tab>"] = function(fallback)
            if cmp.visible() then
                cmp.select_next_item()
            elseif luasnip.expand_or_jumpable() then
                luasnip.expand_or_jump()
            else
                fallback()
            end
        end,

        ["<S-Tab>"] = function(fallback)
            if cmp.visible() then
                cmp.select_prev_item()
            elseif luasnip.jumpable(-1) then
                luasnip.jump(-1)
            else
                fallback()
            end
        end,

        ["<C-e>"] = cmp.mapping.abort(),

        ["<CR>"] = cmp.mapping.confirm({
            select = true,
        }),
    }),

    formatting = {
        format = function(entry, item)
            item.menu = ({
                nvim_lsp = "[LSP]",
                buffer = "[BUF]",
                path = "[PATH]",
                luasnip = "[SNIP]",
            })[entry.source.name]

            return item
        end,
    },

    sources = cmp.config.sources({
        { name = "nvim_lsp" },
        { name = "luasnip" },
        { name = "buffer" },
        { name = "path" },
    }),

    window = {
        completion = cmp.config.window.bordered(),
        documentation = cmp.config.window.bordered(),
    },
})

-- Search

cmp.setup.cmdline("/", {
    mapping = cmp.mapping.preset.cmdline(),
    sources = {
        { name = "buffer" },
    },
})

-- Command line

cmp.setup.cmdline(":", {
    mapping = cmp.mapping.preset.cmdline(),
    sources = cmp.config.sources({
        { name = "path" },
    }, {
        { name = "cmdline" },
    }),
})

-- lspkind
cmp.setup({
    formatting = {
        format = lspkind.cmp_format({
            mode = "symbol_text",

            menu = {
                nvim_lsp = "[LSP]",
                buffer = "[BUF]",
                path = "[PATH]",
                luasnip = "[SNIP]",
            },
        }),
    },
})
