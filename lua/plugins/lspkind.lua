return {
    "hrsh7th/nvim-cmp",
    opts = function(_, opts)
        local lspkind = require "lspkind"
        opts.formatting = {
            format = lspkind.cmp_format {
                mode = "symbol_text",
                menu = {
                    buffer = "[Buffer]",
                    nvim_lsp = "[LSP]",
                    luasnip = "[LuaSnip]",
                    nvim_lua = "[Lua]",
                    latex_symbols = "[Latex]",
                },
                show_labelDetails = true,
            },
        }
    end,
}
