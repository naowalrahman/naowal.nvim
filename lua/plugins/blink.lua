return {
    "saghen/blink.cmp",
    opts = {
        keymap = {
            preset = "enter",
            ["<Tab>"] = { "select_next", "fallback" },
            ["<S-Tab>"] = { "select_prev", "fallback" },
        },
        completion = {
            list = { selection = { auto_insert = false, preselect = true } },
            menu = {
                border = "rounded",
                winhighlight = "Normal:Normal,FloatBorder:FloatBorder,CursorLine:BlinkCmpMenuSelection,Search:None",
                winblend = 30,
                draw = {
                    columns = {
                        { "kind_icon" },
                        { "label", "label_description", gap = 1 },
                        { "kind" },
                    },
                },
            },
            documentation = {
                window = {
                    border = "rounded",
                    winblend = 30,
                    winhighlight = "Normal:Normal,FloatBorder:FloatBorder,CursorLine:BlinkCmpDocCursorLine,Search:None",
                },
            },
            ghost_text = { enabled = true },
        },
        signature = {
            enabled = true,
            window = {
                border = "rounded",
                winblend = 30,
                winhighlight = "Normal:Normal,FloatBorder:FloatBorder,CursorLine:BlinkCmpSignatureHelpBorder,Search:None",
            },
        },
        sources = { per_filetype = { codecompanion = { "codecompanion" } } },
        appearance = { nerd_font_variant = "normal" },
    },
}
