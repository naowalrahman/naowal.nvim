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
        "rebelot/kanagawa.nvim",
        lazy = false,
        priority = 1000,
        build = ":KanagawaCompile",
        opts = {
            compile = true,
            commentStyle = { italic = true },
            keywordStyle = { bold = true, italic = false },
            statementStyle = { bold = true },
            functionStyle = {},
            typeStyle = {},
        },
        config = function(_, opts)
            require("kanagawa").setup(opts)
            -- rebuild compiled colorscheme when this file is saved
            vim.api.nvim_create_autocmd("BufWritePost", {
                group = vim.api.nvim_create_augroup("kanagawa_recompile", { clear = true }),
                pattern = vim.fn.stdpath "config" .. "/lua/plugins/colorschemes.lua",
                command = "KanagawaCompile",
            })
        end,
    },
    {
        "LazyVim/LazyVim", -- set colorscheme, override version = "*" from LazyVim's own spec
        version = false,
        opts = { colorscheme = "kanagawa" },
    },
    {
        "nvim-zh/colorful-winsep.nvim", -- active window border
        config = true,
        event = { "WinLeave" },
        opts = { animate = { enabled = false } },
    },
}
