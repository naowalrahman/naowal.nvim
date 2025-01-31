return {
    "saghen/blink.cmp",
    opts = function(_, opts)
        opts.completion.menu.draw.columns = {
            { "kind_icon" },
            { "label", "label_description", gap = 1 },
            { "kind" },
            { "source_name" },
        }

        opts.signature = { enabled = true }
        opts.sources.per_filetype = {
            codecompanion = { "codecompanion" },
        }
    end,
}
