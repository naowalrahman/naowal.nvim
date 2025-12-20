return {
    "nvim-lua/plenary.nvim",
    "nvim-treesitter/nvim-treesitter",
    "j-hui/fidget.nvim",
    "ravitemer/codecompanion-history.nvim",
    {
        "nvim-mini/mini.diff", -- Cleaner diff
        config = function()
            local diff = require "mini.diff"
            diff.setup {
                -- Disabled by default
                source = diff.gen_source.none(),
            }
        end,
    },
    {
        "MeanderingProgrammer/render-markdown.nvim",
        ft = { "markdown", "codecompanion" },
    },
    {
        "ravitemer/mcphub.nvim", -- Manage MCP servers
        cmd = "MCPHub",
        build = "bundled_build.lua",
        opts = {
            use_bundled_binary = true, -- Use local `mcp-hub` binary
            workspace = {
                enabled = true, -- Enable project-local configuration files
                look_for = { ".mcphub/servers.json", ".vscode/mcp.json", ".cursor/mcp.json" },
                reload_on_dir_changed = true,
            },
        },
    },
    {
        "Davidyz/VectorCode", -- Index and search code in your repositories
        version = "*",
        build = "uv tool install vectorcode",
    },
    {
        "HakonHarnes/img-clip.nvim", -- Share images with the chat buffer
        event = "VeryLazy",
        cmd = "PasteImage",
        opts = {
            filetypes = {
                codecompanion = {
                    prompt_for_file_name = false,
                    template = "[Image]($FILE_PATH)",
                    use_absolute_path = true,
                },
            },
        },
    },
}
