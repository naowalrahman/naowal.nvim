return {
    "folke/snacks.nvim",
    opts = function(_, opts)
        opts.dashboard = {
            preset = {
                header = [[
███╗   ██╗ █████╗  ██████╗ ██╗    ██╗ █████╗ ██╗     ██╗
████╗  ██║██╔══██╗██╔═══██╗██║    ██║██╔══██╗██║     ██║
██╔██╗ ██║███████║██║   ██║██║ █╗ ██║███████║██║     ██║
██║╚██╗██║██╔══██║██║   ██║██║███╗██║██╔══██║██║     ╚═╝
██║ ╚████║██║  ██║╚██████╔╝╚███╔███╔╝██║  ██║███████╗██╗
╚═╝  ╚═══╝╚═╝  ╚═╝ ╚═════╝  ╚══╝╚══╝ ╚═╝  ╚═╝╚══════╝╚═╝
                ]],
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
                    enabled = Snacks.git.get_root() ~= nil,
                    cmd = "git status --short --branch --renames",
                    height = 5,
                    padding = 1,
                    ttl = 5 * 60,
                    indent = 3,
                },
                { section = "startup" },
            },
        }
    end,
}
