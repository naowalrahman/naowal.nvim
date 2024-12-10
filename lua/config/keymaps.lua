-- Keymaps are automatically loaded on the VeryLazy event
-- Default keymaps that are always set: https://github.com/LazyVim/LazyVim/blob/main/lua/lazyvim/config/keymaps.lua
-- Add any additional keymaps here

vim.keymap.set("n", "<F5>", ":RunFile<CR>", { noremap = true, silent = true })
vim.keymap.set("n", "<F6>", ":CompileFile<CR>", { noremap = true, silent = true })
