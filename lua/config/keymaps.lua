-- Keymaps are automatically loaded on the VeryLazy event
-- Default keymaps that are always set: https://github.com/LazyVim/LazyVim/blob/main/lua/lazyvim/config/keymaps.lua
-- Add any additional keymaps here

-- file runner
vim.keymap.set("n", "<F5>", ":RunFile<CR>", { noremap = true, silent = true })
vim.keymap.set("n", "<F6>", ":CompileFile<CR>", { noremap = true, silent = true })

-- terminal escape
-- vim.keymap.set("t", "<Esc>", "<C-\\><C-n>", { noremap = true, silent = true })

-- toggle inline completions (windsurf codeium)
vim.keymap.set(
    "n",
    "<leader>ct",
    function() require("codeium").toggle() end,
    { silent = false, desc = "Toggle Codeium completions" }
)

-- set working directory to current buffer's directory
vim.keymap.set(
    "n",
    "<leader>cb",
    ":cd %:p:h<CR>:pwd<CR>",
    { noremap = true, silent = false, desc = "Cd to buffer dir" }
)

-- open code actions
vim.keymap.set("n", "<C-x>", function() vim.lsp.buf.code_action() end, { noremap = true, silent = true })
