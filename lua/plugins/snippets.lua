return {
    {
        "L3MON4D3/LuaSnip",
        config = function(plugin, opts)
            -- include the default astronvim config that calls the setup call
            require "astronvim.plugins.configs.luasnip"(plugin, opts)
            -- load snippets paths
            require("luasnip.loaders.from_vscode").lazy_load {
                paths = { vim.fn.stdpath "config" .. "/snippets" },
            }
        end,
    },
    {
        "iurimateus/luasnip-latex-snippets.nvim",
        requires = { "L3MON4D3/LuaSnip", "lervag/vimtex" },
        config = function()
            require("luasnip-latex-snippets").setup()
            -- require("luasnip").config.setup { enable_autosnippets = true }
        end,
    },
}
