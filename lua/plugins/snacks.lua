local header = [[
███╗   ██╗ █████╗  ██████╗ ██╗    ██╗ █████╗ ██╗     ██╗
████╗  ██║██╔══██╗██╔═══██╗██║    ██║██╔══██╗██║     ██║
██╔██╗ ██║███████║██║   ██║██║ █╗ ██║███████║██║     ██║
██║╚██╗██║██╔══██║██║   ██║██║███╗██║██╔══██║██║     ╚═╝
██║ ╚████║██║  ██║╚██████╔╝╚███╔███╔╝██║  ██║███████╗██╗
╚═╝  ╚═══╝╚═╝  ╚═╝ ╚═════╝  ╚══╝╚══╝ ╚═╝  ╚═╝╚══════╝╚═╝
]]

return {
    "folke/snacks.nvim",
    opts = {
        dashboard = {
            preset = {
                header = header,
            },
            sections = {
                { section = "header" },
                {
                    pane = 2,
                    section = "terminal",
                    cmd = "colorscript -e square",
                    height = 5,
                    padding = 1,
                },
                { section = "keys", gap = 1, padding = 1 },
                {
                    pane = 2,
                    icon = " ",
                    title = "Recent Files",
                    section = "recent_files",
                    indent = 2,
                    padding = 1,
                },
                { pane = 2, icon = " ", title = "Projects", section = "projects", indent = 2, padding = 1 },
                {
                    pane = 2,
                    icon = " ",
                    title = "Git Status",
                    section = "terminal",
                    enabled = function() return Snacks.git.get_root() ~= nil end,
                    cmd = "git status --short --branch --renames",
                    height = 5,
                    padding = 1,
                    ttl = 5 * 60,
                    indent = 3,
                },
                { section = "startup" },
            },
        },
        picker = {
            sources = {
                projects = {
                    dev = { "~/Desktop/code", "~/Desktop/code/nvim" },
                },
            },
            actions = {
                ---@param picker snacks.Picker
                opencode_send = function(picker)
                    local entries = {}
                    for _, item in ipairs(picker:selected { fallback = true }) do
                        local parts = {}
                        -- File reference with optional line range
                        if item.file then
                            local ref = "@" .. item.file
                            if item.pos then
                                ref = ref .. (" L%d"):format(item.pos[1])
                                if item.end_pos and item.end_pos[1] ~= item.pos[1] then
                                    ref = ref .. ("-L%d"):format(item.end_pos[1])
                                end
                            end
                            parts[#parts + 1] = ref
                        end
                        -- Text content
                        if item.text and item.text ~= "" then parts[#parts + 1] = item.text end
                        entries[#entries + 1] = table.concat(parts, "\n  ")
                    end
                    require("opencode").prompt(table.concat(entries, "\n") .. "\n")
                end,
                -- opencode_send = require("opencode.integrations.picker.snacks").opencode_send,
            },
            win = {
                input = {
                    keys = {
                        ["<a-a>"] = {
                            "opencode_send",
                            mode = { "n", "i" },
                        },
                    },
                },
            },
        },
    },
}
