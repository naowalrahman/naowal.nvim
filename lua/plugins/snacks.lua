local header = [[
███╗   ██╗ █████╗  ██████╗ ██╗    ██╗ █████╗ ██╗     ██╗
████╗  ██║██╔══██╗██╔═══██╗██║    ██║██╔══██╗██║     ██║
██╔██╗ ██║███████║██║   ██║██║ █╗ ██║███████║██║     ██║
██║╚██╗██║██╔══██║██║   ██║██║███╗██║██╔══██║██║     ╚═╝
██║ ╚████║██║  ██║╚██████╔╝╚███╔███╔╝██║  ██║███████╗██╗
╚═╝  ╚═══╝╚═╝  ╚═╝ ╚═════╝  ╚══╝╚══╝ ╚═╝  ╚═╝╚══════╝╚═╝
]]

local is_git_repo = function() return Snacks.git.get_root() ~= nil end

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
                { section = "keys", padding = 1 },
                {
                    pane = 2,
                    icon = " ",
                    title = "Recent Files",
                    section = "recent_files",
                    indent = 2,
                    padding = 1,
                },
                {
                    pane = 2,
                    icon = " ",
                    title = "Projects",
                    section = "projects",
                    indent = 2,
                    padding = 1,
                },
                {
                    icon = " ",
                    title = "Recent Commits",
                    section = "terminal",
                    enabled = is_git_repo,
                    cmd = "git log --oneline -n 5 --format='%C(auto)%h %<(50,trunc)%s' --color=always | sed 's/\\.\\.$/…/'",
                    padding = 1,
                    height = 5,
                    ttl = 5 * 60,
                    indent = 2,
                    key = "d",
                    action = function()
                        local remote = vim.fn.system("git remote get-url origin"):gsub("\n", "")
                        local branch = vim.fn.system("git branch --show-current"):gsub("\n", "")
                        local url = remote:gsub("^[%w]+@([^:]+):", "https://%1/"):gsub("%.git$", "")
                        vim.fn.system("xdg-open " .. url .. "/commits/" .. branch)
                    end,
                },
                {
                    pane = 2,
                    icon = " ",
                    title = "Git Status",
                    section = "terminal",
                    enabled = is_git_repo,
                    cmd = "git status --short --branch --renames",
                    padding = 1,
                    ttl = 5 * 60,
                    indent = 2,
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
                ---@type snacks.picker.Action.spec
                opencode_send = function(picker)
                    local ctx = require "opencode.context"
                    local items = vim.tbl_map(function(item)
                        if not item.file then return item.text end
                        local text = item.text
                        if text:find(item.file, 1, true) then
                            text = text:gsub(vim.pesc(item.file), "", 1):match "^%s*(.-)%s*$"
                        end
                        return ctx.format(item.file, {
                            start_line = item.pos and item.pos[1] or nil,
                            end_line = item.end_pos and item.end_pos[1] or nil,
                        }) .. " " .. text
                    end, picker:selected { fallback = true })

                    if #items > 0 then require("opencode").prompt(table.concat(items, "\n") .. "\n") end
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
