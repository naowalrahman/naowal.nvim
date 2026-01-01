return {
    "saghen/blink.cmp",
    -- dependencies = { "Kaiser-Yang/blink-cmp-avante" },
    opts = {
        keymap = {
            preset = "enter",
            ["<Tab>"] = {
                "select_next",
                "snippet_forward",
                function() return require("sidekick").nes_jump_or_apply() end,
                function() vim.lsp.inline_completion.get() end,
                "fallback",
            },
            ["<S-Tab>"] = { "select_prev", "snippet_backward", "fallback" },
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
            ghost_text = { enabled = false },
        },
        signature = {
            enabled = true,
            window = {
                border = "rounded",
                winblend = 30,
                winhighlight = "Normal:Normal,FloatBorder:FloatBorder,CursorLine:BlinkCmpSignatureHelpBorder,Search:None",
            },
        },
        sources = {
            per_filetype = {
                codecompanion = { "codecompanion" },
                -- AvanteInput = { "avante" },
            },
            -- providers = {
            --     avante = {
            --         module = "blink-cmp-avante",
            --         name = "Avante",
            --     },
            -- },
        },
        appearance = { nerd_font_variant = "normal" },
    },
    needs = { "sidekick.nvim", "codecompanion.nvim" },
}
