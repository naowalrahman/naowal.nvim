return {
    {
        "EdenEast/nightfox.nvim",
        opts = {
            options = {
                styles = {
                    comments = "italic",
                    conditionals = "bold",
                    keywords = "bold",
                    functions = "NONE",
                    strings = "NONE",
                    numbers = "NONE",
                    types = "NONE",
                    operators = "NONE",
                    variables = "NONE",
                },
            },
            groups = {
                all = { -- default window border
                    WinSeparator = { fg = "palette.comment", bg = "NONE" },
                },
            },
        },
    },
    {
        "vague-theme/vague.nvim",
        opts = {
            on_highlights = function(highlights, colors)
                highlights["@keyword"] = { fg = colors.keyword, bold = true }
                highlights["@keyword.conditional"] = { fg = colors.keyword, bold = true }
                highlights["@keyword.return"].bold = true
                highlights["@keyword.return"].italic = false
                highlights["@string"] = { fg = colors.string, italic = false }
            end,
        },
    },
    {
        "craftzdog/solarized-osaka.nvim",
        lazy = false,
        priority = 1000,
        opts = {
            on_highlights = function(hl, c)
                hl.SnacksPicker = { bg = c.bg_float }
                hl.SnacksPickerBorder = { fg = c.bg_float, bg = c.none }
                hl.SnacksPickerBox = { bg = c.none }
                hl.SnacksPickerTitle = { fg = c.fg_float, bg = c.bg_float }
            end,
        },
    },
    {
        "LazyVim/LazyVim", -- set colorscheme, override version = "*" from LazyVim's own spec
        version = false,
        opts = { colorscheme = "solarized-osaka" },
    },
    {
        "nvim-zh/colorful-winsep.nvim", -- active window border
        config = true,
        event = { "WinLeave" },
        opts = { animate = { enabled = false } },
    },
}
