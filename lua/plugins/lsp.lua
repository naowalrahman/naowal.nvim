return {
    {
        "neovim/nvim-lspconfig",
        opts = function(_, opts)
            opts.inlay_hints.enabled = false
            local architecture = vim.loop.os_uname().machine
            if architecture == "aarch64" then
                opts.servers.clangd.mason = false
                opts.servers.lua_ls.mason = false
            end

            -- Formatting and code actions
            opts.servers.ruff = {
                on_attach = function(client, _)
                    client.server_capabilities.hoverProvider = false
                    client.server_capabilities.completionProvider = false
                    client.server_capabilities.diagnosticProvider = false
                end,
            }

            -- Type checking, completions, hover, references, etc.
            opts.servers.ty = {}
        end,
    },
    {
        "stevearc/conform.nvim",
        opts = {
            formatters_by_ft = {
                sh = { "beautysh" },
                bash = { "beautysh" },
                zsh = { "beautysh" },
            },
        },
    },
    {
        "mfussenegger/nvim-lint",
        opts = {
            linters = {
                ["markdownlint-cli2"] = {
                    -- disable line length rule
                    args = { "--disable", "MD013", "--" },
                },
            },
        },
    },
}
