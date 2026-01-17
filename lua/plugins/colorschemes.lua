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
            style = {
                conditionals = "bold",
                keywords = "bold",
                keyword_return = "bold",
                strings = "none",
            },
        },
    },
    {
        "LazyVim/LazyVim", -- set colorscheme
        opts = {
            colorscheme = "vague",
        },
    },
    {
        "nvim-zh/colorful-winsep.nvim", -- active window border
        config = true,
        event = { "WinLeave" },
        opts = {
            animate = { enabled = false },
        },
    },
}
