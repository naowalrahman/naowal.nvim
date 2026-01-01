return {
    -- dir = "/home/naowal/Desktop/code/codecompanion.nvim",
    "olimorris/codecompanion.nvim",
    enabled = true,
    dependencies = require "plugins.codecompanion.dependencies",
    opts = {
        adapters = require "plugins.codecompanion.adapters",
        extensions = require "plugins.codecompanion.extension_opts",
        strategies = {
            chat = {
                name = "copilot",
                model = "claude-sonnet-4.5",
                tools = {
                    groups = {
                        ["Agent"] = {
                            description = "Full agent mode with all tools",
                            tools = {
                                "cmd_runner",
                                "create_file",
                                "file_search",
                                "get_changed_files",
                                "grep_search",
                                "insert_edit_into_file",
                                "read_file",
                                "vectorcode_toolbox",
                                "context7",
                                "brave_search__brave_web_search",
                                "fetch_webpage",
                            },
                            opts = { collapse_tools = false },
                        },
                        ["Planning"] = {
                            description = "Tools for planning and asking clarifying questions",
                            tools = {
                                "file_search",
                                "get_changed_files",
                                "grep_search",
                                "read_file",
                                "vectorcode_toolbox",
                                "context7",
                                "brave_search__brave_web_search",
                                "fetch_webpage",
                            },
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
            diff = { provider = "inline" },
        },
    },
    keys = {
        {
            "<leader>ac",
            "<cmd>CodeCompanionChat Toggle<CR>",
            desc = "Toggle a CodeCompanion chat buffer",
            mode = { "n", "v" },
        },
        {
            "ga",
            "<cmd>CodeCompanionChat Add<CR>",
            desc = "Add selected text to a chat buffer",
            mode = { "v" },
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
