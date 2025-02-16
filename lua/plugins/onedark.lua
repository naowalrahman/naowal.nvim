return {
    -- add gruvbox
    {
        "olimorris/onedarkpro.nvim",
        opts = function(_, opts)
            opts.styles = {
                types = "NONE",
                methods = "underline",
                numbers = "NONE",
                strings = "NONE",
                comments = "italic",
                keywords = "bold,italic",
                constants = "NONE",
                functions = "bold",
                operators = "NONE",
                variables = "NONE",
                parameters = "italic",
                conditionals = "NONE",
                virtual_text = "NONE",
            }
        end,
    },

    -- Configure LazyVim to load gruvbox
    {
        "LazyVim/LazyVim",
        opts = {
            colorscheme = "onedark_vivid",
        },
    },
}
