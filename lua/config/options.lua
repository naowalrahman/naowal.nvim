-- Options are automatically loaded before lazy.nvim startup
-- Default options that are always set: https://github.com/LazyVim/LazyVim/blob/main/lua/lazyvim/config/options.lua
-- Add any additional options here

local opt, g = vim.opt, vim.g

opt.shiftwidth = 4
opt.tabstop = 4
opt.softtabstop = 4
opt.wrap = true
opt.breakindent = true

-- opt.guifont = "JetbrainsMono Nerd Font:h12"
-- opt.guicursor = "n-v-c:block,i-ci-ve:ver25,r-cr:hor20,o:hor50,"
-- .. "a:blinkwait700-blinkoff400-blinkon250-Cursor/lCursor,"
-- .. "sm:block-blinkwait175-blinkoff150-blinkon175"
opt.winblend = 30

if vim.g.neovide then
    opt.linespace = 2

    g.neovide_padding_top = 2
    g.neovide_padding_bottom = 2
    g.neovide_padding_right = 5
    g.neovide_padding_left = 5
    g.neovide_hide_mouse_when_typing = true
    g.neovide_refresh_rate = 288

    g.neovide_scroll_animation_length = 0.13
    g.neovide_cursor_animate_command_line = true
    g.neovide_cursor_animate_in_insert_mode = true
    -- g.neovide_cursor_smooth_blink = true
    g.neovide_scale_factor = 1
end

g.ai_cmp = false

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
