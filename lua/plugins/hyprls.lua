return {
    "neovim/nvim-lspconfig",
    -- event = "VeryLazy",
    opts = function(_, opts)
        opts.servers.hyprls = {
            cmd = { "hyprls", "--stdio" },
            filetypes = { "hyprlang" },
            root_dir = require("lspconfig.util").find_git_ancestor(),
            single_file_support = true,
        }
    end,
}
