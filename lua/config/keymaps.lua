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

-- neovim + tmux cross navigation
local nvim_tmux_nav = require "nvim-tmux-navigation"
vim.keymap.set("n", "<C-h>", nvim_tmux_nav.NvimTmuxNavigateLeft)
vim.keymap.set("n", "<C-j>", nvim_tmux_nav.NvimTmuxNavigateDown)
vim.keymap.set("n", "<C-k>", nvim_tmux_nav.NvimTmuxNavigateUp)
vim.keymap.set("n", "<C-l>", nvim_tmux_nav.NvimTmuxNavigateRight)
vim.keymap.set("n", "<C-\\>", nvim_tmux_nav.NvimTmuxNavigateLastActive)
vim.keymap.set("n", "<C-Space>", nvim_tmux_nav.NvimTmuxNavigateNext)
