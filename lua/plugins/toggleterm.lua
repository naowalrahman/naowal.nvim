return {
    "akinsho/toggleterm.nvim",
    opts = {
        shell = vim.loop.os_uname().sysname == "Linux" and "zsh" or "pwsh"
    }
}
