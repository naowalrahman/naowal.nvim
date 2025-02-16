return {
    "saghen/blink.cmp",
    opts = function(_, opts)
        opts.keymap = {
            preset = "enter",
            ["<Tab>"] = { "select_next", "fallback" },
            ["<S-Tab>"] = { "select_prev", "fallback" },
        }

        opts.completion.list = { selection = { auto_insert = false, preselect = true } }

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
        -- completion menu transparency
        opts.completion.documentation.window = { winblend = 30 }
        opts.completion.menu.winblend = 30
        opts.signature.window = { winblend = 30 }

        opts.appearance.nerd_font_variant = "normal"

        opts.completion.ghost_text.enabled = true
    end,
}
