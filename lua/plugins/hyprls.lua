return {
    "neovim/nvim-lspconfig",
    -- event = "VeryLazy",
    opts = function(_, opts)
        opts.servers.hyprls = {
            cmd = { "hyprls", "--stdio" },
            filetypes = { "hyprlang" },
            root_dir = vim.fs.dirname(vim.fs.find(".git", { upward = true })[1]),
            single_file_support = true,
        }
    end,
}
