return {
    "folke/noice.nvim",
    opts = {
        routes = {
            {
                filter = {
                    event = "lsp",
                    kind = "progress",
                    find = "jdtls",
                },
                opts = { skip = true },
            },
        },
        lsp = { signature = { enabled = false } },
    },
}
