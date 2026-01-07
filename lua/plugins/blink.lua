return {
    {
        "xzbdmw/colorful-menu.nvim",
    },
    {
        "saghen/blink.cmp",
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
                    -- border = "rounded",
                    -- winhighlight = "Normal:Normal,FloatBorder:FloatBorder,CursorLine:BlinkCmpMenuSelection,Search:None",
                    winblend = 10,
                    draw = {
                        treesitter = { "lsp" },
                        columns = {
                            { "kind_icon" },
                            { "label", gap = 1 },
                            { "kind" },
                        },
                        components = {
                            label = {
                                text = function(ctx) return require("colorful-menu").blink_components_text(ctx) end,
                                highlight = function(ctx)
                                    return require("colorful-menu").blink_components_highlight(ctx)
                                end,
                            },
                            kind_icon = {
                                ellipsis = false,
                                highlight = function(ctx)
                                    local _, hl, _ = require("mini.icons").get("lsp", ctx.kind)
                                    return hl
                                end,
                            },
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
            appearance = { nerd_font_variant = "normal" },
        },
    },
}
