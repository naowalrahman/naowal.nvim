return {
    "olimorris/codecompanion.nvim",
    dependencies = {
        "nvim-lua/plenary.nvim",
        "nvim-treesitter/nvim-treesitter",
    },
    opts = {
        adapters = {
            deepseek = function()
                return require("codecompanion.adapters").extend("deepseek", {
                    env = {
                        api_key = "cmd: \\cat $HOME/Desktop/apikeys/deepseek-apikey.txt",
                    },
                    schema = { model = { default = "deepseek-chat" } },
                })
            end,
        },
        strategies = {
            chat = {
                adapter = "copilot",
                slash_commands = {
                    ["file"] = {
                        description = "Select a file using picker",
                        opts = {
                            provider = "snacks",
                            contains_code = true,
                        },
                    },
                },
            },
            inline = { adapter = "copilot" },
        },
        display = {
            diff = { provider = "mini_diff" },
        },
    },
    keys = {
        {
            "<leader>a",
            "<cmd>CodeCompanionChat Toggle<CR>",
            desc = "Toggle a chat buffer",
            mode = { "n", "v" },
        },
        {
            "ga",
            "<cmd>CodeCompanionChat Add<CR>",
            desc = "Add selected text to a chat buffer",
            mode = { "n", "v" },
        },
        -- {
        --     "<C-i>",
        --     "<cmd>CodeCompanion<CR>",
        --     desc = "CodeCompanion Inline Chat",
        --     mode = {"n","v"}
        -- },
        {
            "<C-a>",
            "<cmd>CodeCompanionActions<CR>",
            desc = "Open the CodeCompanion action palette",
            mode = { "n", "v" },
        },
    },
}
