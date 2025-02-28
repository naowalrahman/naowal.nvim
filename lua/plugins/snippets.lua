return {
    {
        "iurimateus/luasnip-latex-snippets.nvim",
        lazy = true,
        requires = { "L3MON4D3/LuaSnip", "lervag/vimtex" },
        config = function() require("luasnip-latex-snippets").setup() end,
    },
}
