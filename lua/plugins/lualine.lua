return {
    "nvim-lualine/lualine.nvim",
    opts = function(_, opts)
        opts.sections.lualine_a = {
            {
                "mode",
                separator = { left = "", right = "" },
                right_padding = 2,
                color = { gui = "bold" },
            },
        }
        opts.sections.lualine_z = {
            {
                function() return " " .. os.date "%R" end,
                separator = { left = "", right = "" },
            },
        }
    end,
}
