return {
    "folke/noice.nvim",
    opts = function(_, opts)
        opts.routes = {
            {
                filter = {
                    event = "lsp",
                    kind = "progress",
                    find = "jdtls",
                },
                opts = { skip = true },
            },
        }
    end,
}
