return {
    "olimorris/codecompanion.nvim",
    enabled = true,
    dependencies = require "plugins.codecompanion.dependencies",
    opts = {
        adapters = require "plugins.codecompanion.adapters",
        extensions = require "plugins.codecompanion.extension_opts",
        strategies = {
            chat = {
                adapter = "claude4",
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
        prompt_library = {
            ["Agentic Workflow"] = require "plugins.codecompanion.agent",
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
        {
            "<C-i>",
            "<cmd>'<,'>CodeCompanion<CR>",
            desc = "CodeCompanion Inline Chat",
            mode = { "v" },
        },
        {
            "<C-a>",
            "<cmd>CodeCompanionActions<CR>",
            desc = "Open the CodeCompanion action palette",
            mode = { "n", "v" },
        },
    },
}
