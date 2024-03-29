-- [[ Configure nvim-cmp ]]
-- See `:help cmp`
local cmp = require("cmp")
local luasnip = require("luasnip")
require("luasnip.loaders.from_vscode").lazy_load()
luasnip.config.setup {}

cmp.setup {
    snippet = {
        expand = function(args)
            luasnip.lsp_expand(args.body)
        end,
    },
    mapping = cmp.mapping.preset.insert {
        ["<C-n>"] = cmp.mapping.select_next_item(),
        ["<C-p>"] = cmp.mapping.select_prev_item(),
        ["<C-d>"] = cmp.mapping.scroll_docs(-4),
        ["<C-f>"] = cmp.mapping.scroll_docs(4),
        ["<C-y>"] = cmp.mapping.confirm(),
        ["<CR>"] = nil,
        -- Helps with copilot
        ["<Tab>"] = nil,
        ["<S-Tab>"] = nil,
    },
    sources = {
        { name = "nvim_lsp" },
        { name = "luasnip" },
    },
    window = {
        completion = {
            border = "rounded",
            scrolloff = 2,
        },
        documentation = {
            border = "rounded",
            scrolloff = 2,
        },
    },
}
