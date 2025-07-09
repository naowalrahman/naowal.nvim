return {
    history = {
        enabled = true,
        opts = {
            keymap = "gh",
            save_chat_keymap = "sc",
            auto_save = false,
            auto_generate_title = true,
            continue_last_chat = false,
            delete_on_clearing_chat = false,
            picker = "snacks",
            enable_logging = false,
            dir_to_save = vim.fn.stdpath "data" .. "/codecompanion-history",
        },
    },
    mcphub = {
        callback = "mcphub.extensions.codecompanion",
        opts = {
            make_vars = true,
            make_slash_commands = true,
            show_result_in_chat = true,
        },
    },
    vectorcode = {
        -- @type VectorCode.CodeCompanion.extensions
        opts = {
            add_tool = true,
            tool_group = {
                enable = true,
                extras = { "file_search" },
                collapse = false,
            },
        },
    },
}
