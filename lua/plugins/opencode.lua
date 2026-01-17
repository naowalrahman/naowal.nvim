require("which-key").add { "<leader>o", group = "+opencode", icon = "" }
return {
    {
        "NickvanDyke/opencode.nvim",
        lazy = true,
        dependencies = { "folke/snacks.nvim" },
        config = function()
            ---@type opencode.Opts
            vim.g.opencode_opts = {} -- optional configuration

            -- Required for `opts.events.reload`.
            vim.o.autoread = true

            local opencode = require "opencode"
            vim.keymap.set(
                { "n", "x" },
                "<leader>ox",
                function() opencode.ask("@this: ", { submit = true }) end,
                { desc = "Ask opencode" }
            )
            vim.keymap.set(
                { "n", "x" },
                "<leader>oe",
                function() opencode.select() end,
                { desc = "Execute opencode action" }
            )
            vim.keymap.set(
                { "n", "t" },
                "<A-.>",
                function() opencode.toggle() end,
                { desc = "Toggle opencode", noremap = true }
            )
            vim.keymap.set(
                { "n", "x" },
                "<leader>or",
                function() return opencode.operator "@this " end,
                { expr = true, desc = "Add range to opencode" }
            )
            vim.keymap.set(
                "n",
                "<leader>ol",
                function() return opencode.operator "@this " .. "_" end,
                { expr = true, desc = "Add line to opencode" }
            )
        end,
    },
    {
        "nvim-lualine/lualine.nvim",
        opts = function(_, opts) table.insert(opts.sections.lualine_x, 1, { require("opencode").statusline }) end,
    },
}
