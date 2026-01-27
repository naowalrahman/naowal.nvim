-- Keymaps are automatically loaded on the VeryLazy event
-- Default keymaps that are always set: https://github.com/LazyVim/LazyVim/blob/main/lua/lazyvim/config/keymaps.lua
-- Add any additional keymaps here

-- file runner
vim.keymap.set("n", "<F5>", ":RunFile<CR>", { noremap = true, silent = true })
vim.keymap.set("n", "<F6>", ":CompileFile<CR>", { noremap = true, silent = true })

-- terminal escape
-- vim.keymap.set("t", "<Esc>", "<C-\\><C-n>", { noremap = true, silent = true })

-- toggle inline completions (copilot)
vim.keymap.set("n", "<leader>ct", function()
    local enabled = vim.lsp.inline_completion.is_enabled()
    vim.lsp.inline_completion.enable(not enabled)

    vim.notify("Inline completions " .. (enabled and "disabled" or "enabled"))
end, { silent = false, desc = "Toggle inline completions" })
