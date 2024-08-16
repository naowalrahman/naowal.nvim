---@module "neominimap.config.meta"
return {
    "Isrothy/neominimap.nvim",
    lazy = false, -- NOTE: NO NEED to Lazy load

    keys = {
        { "<leader>mt", "<cmd>Neominimap toggle<cr>", desc = "Toggle minimap" },
        { "<leader>mo", "<cmd>Neominimap on<cr>", desc = "Enable minimap" },
        { "<leader>mc", "<cmd>Neominimap off<cr>", desc = "Disable minimap" },
        { "<leader>mf", "<cmd>Neominimap focus<cr>", desc = "Focus on minimap" },
        { "<leader>mu", "<cmd>Neominimap unfocus<cr>", desc = "Unfocus minimap" },
        { "<leader>ms", "<cmd>Neominimap toggleFocus<cr>", desc = "Toggle focus on minimap" },
        { "<leader>mwt", "<cmd>Neominimap winToggle<cr>", desc = "Toggle minimap for current window" },
        { "<leader>mwr", "<cmd>Neominimap winRefresh<cr>", desc = "Refresh minimap for current window" },
        { "<leader>mwo", "<cmd>Neominimap winOn<cr>", desc = "Enable minimap for current window" },
        { "<leader>mwc", "<cmd>Neominimap winOff<cr>", desc = "Disable minimap for current window" },
        { "<leader>mbt", "<cmd>Neominimap bufToggle<cr>", desc = "Toggle minimap for current buffer" },
        { "<leader>mbr", "<cmd>Neominimap bufRefresh<cr>", desc = "Refresh minimap for current buffer" },
        { "<leader>mbo", "<cmd>Neominimap bufOn<cr>", desc = "Enable minimap for current buffer" },
        { "<leader>mbc", "<cmd>Neominimap bufOff<cr>", desc = "Disable minimap for current buffer" },
    },
    init = function()
        vim.g.neominimap = {
            auto_enable = true, ---@type boolean
            log_level = vim.log.levels.OFF, ---@type integer
            notification_level = vim.log.levels.INFO, ---@type integer
            log_path = vim.fn.stdpath "data" .. "/neominimap.log", ---@type string

            ---@type string[]
            exclude_filetypes = {
                "help",
            },

            ---@type string[]
            exclude_buftypes = {
                "nofile",
                "nowrite",
                "quickfix",
                "terminal",
                "prompt",
            },

            ---@type fun(bufnr: integer): boolean
            buf_filter = function() return true end,

            ---@type fun(winid: integer): boolean
            win_filter = function() return true end,

            -- If set to nil, there is no maximum height restriction
            max_minimap_height = nil, ---@type integer?
            minimap_width = 20, ---@type integer
            x_multiplier = 4, ---@type integer
            y_multiplier = 1, ---@type integer
            delay = 200, ---@type integer -- milliseconds
            sync_cursor = true, ---@type boolean
            click = {
                enabled = true, ---@type boolean
                auto_switch_focus = true, ---@type boolean
            },

            diagnostic = {
                enabled = true, ---@type boolean
                severity = vim.diagnostic.severity.WARN, ---@type integer
                mode = "line", ---@type Neominimap.Handler.MarkMode
                priority = {
                    ERROR = 100, ---@type integer
                    WARN = 90, ---@type integer
                    INFO = 80, ---@type integer
                    HINT = 70, ---@type integer
                },
            },

            git = {
                enabled = true, ---@type boolean
                mode = "sign", ---@type Neominimap.Handler.MarkMode
            },
            search = {
                enabled = true, ---@type boolean
                mode = "line", ---@type Neominimap.Handler.MarkMode
            },
            treesitter = {
                enabled = true, ---@type boolean
            },
            margin = {
                right = 0, ---@type integer
                top = 0, ---@type integer
                bottom = 0, ---@type integer
            },
            fold = {
                enabled = true, ---@type boolean
            },
            z_index = 1, ---@type integer
            -- Accepts all usual border style options (e.g., "single", "double")
            window_border = "none", ---@type string | string[] | [string, string][]

            ---@type table | fun(winid: integer) : table
            winopt = {},
            ---@type table | fun(bufnr: integer) : table
            bufopt = {},
        }
    end,
}
