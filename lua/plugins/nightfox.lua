return {
    {
        "EdenEast/nightfox.nvim",
        opts = {
            options = {
                styles = {
                    comments = "NONE",
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
        "LazyVim/LazyVim", -- set colorscheme
        opts = {
            colorscheme = "carbonfox",
        },
    },
    {
        "nvim-zh/colorful-winsep.nvim", -- active window border
        config = true,
        event = { "WinLeave" },
    },
}
