-- Vague has no bufferline integration; we pull vague.get_palette() so tints survive bufferline’s ColorScheme refresh.
local function vague_slant_highlights(defaults)
    local c = require("vague").get_palette()
    local h = vim.deepcopy(defaults.highlights)

    h.fill.bg = c.bg
    for _, spec in ipairs({
        { "separator", c.line },
        { "separator_visible", c.line },
        { "separator_selected", c.visual },
        { "tab_separator", c.line },
        { "tab_separator_selected", c.visual },
    }) do
        h[spec[1]].fg, h[spec[1]].bg = c.bg, spec[2]
    end
    h.offset_separator.bg, h.trunc_marker.bg, h.group_separator.bg = c.bg, c.bg, c.line

    for _, name in ipairs({
        "background", "buffer", "close_button", "numbers", "tab", "tab_close", "diagnostic", "hint", "info",
        "warning", "error", "modified", "duplicate", "pick", "hint_diagnostic", "info_diagnostic",
        "warning_diagnostic", "error_diagnostic", "buffer_visible", "close_button_visible", "numbers_visible",
        "diagnostic_visible", "hint_visible", "info_visible", "warning_visible", "error_visible",
        "modified_visible", "duplicate_visible", "pick_visible", "hint_diagnostic_visible",
        "info_diagnostic_visible", "warning_diagnostic_visible", "error_diagnostic_visible",
    }) do
        h[name].bg = c.line
    end
    for _, name in ipairs({
        "tab_selected", "close_button_selected", "buffer_selected", "numbers_selected", "diagnostic_selected",
        "hint_selected", "info_selected", "warning_selected", "error_selected", "modified_selected",
        "duplicate_selected", "pick_selected", "hint_diagnostic_selected", "info_diagnostic_selected",
        "warning_diagnostic_selected", "error_diagnostic_selected",
    }) do
        h[name].bg = c.visual
    end
    h.indicator_selected.bg, h.indicator_selected.fg = c.visual, c.fg

    return h
end

return {
    "akinsho/bufferline.nvim",
    opts = function(_, opts)
        opts.options = opts.options or {}
        opts.options.separator_style = "slant"
        opts.highlights = vague_slant_highlights
    end,
}
