-- Options are automatically loaded before lazy.nvim startup
-- Default options that are always set: https://github.com/LazyVim/LazyVim/blob/main/lua/lazyvim/config/options.lua
-- Add any additional options here

local opt, g = vim.opt, vim.g

opt.shiftwidth = 4
opt.tabstop = 4
opt.softtabstop = 4
opt.wrap = true
opt.breakindent = true
opt.guifont = "FiraCode Nerd Font:h10"

g.neovide_padding_top = 5
g.neovide_padding_bottom = 5
g.neovide_padding_right = 5
g.neovide_padding_left = 5

vim.filetype.add {
    -- extension = {
    --   foo = "fooscript",
    -- },
    -- filename = {
    --   ["Foofile"] = "fooscript",
    -- },
    -- pattern = {
    --   ["~/%.config/foo/.*"] = "fooscript",
    -- },
    pattern = {
        [".*/hypr/.*%.conf"] = "hyprlang",
    },
}
