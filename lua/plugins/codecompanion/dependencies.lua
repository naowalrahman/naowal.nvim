return {
    "nvim-lua/plenary.nvim",
    "nvim-treesitter/nvim-treesitter",
    "j-hui/fidget.nvim",
    "ravitemer/codecompanion-history.nvim",
    {
        "ravitemer/mcphub.nvim", -- Manage MCP servers
        cmd = "MCPHub",
        build = "bundled_build.lua",
        config = function()
            require("mcphub").setup {
                use_bundled_binary = true, -- Use local `mcp-hub` binary
            }
        end,
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
