return {
    "akinsho/toggleterm.nvim",
    opts = {
        shell = vim.fn.has("win32") and "pwsh" or "zsh"
    }
}
