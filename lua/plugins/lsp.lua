return {
    {
        "neovim/nvim-lspconfig",
        opts = function(_, opts)
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

            -- Completions only (disable diagnostics)
            opts.servers.pyrefly = {
                handlers = {
                    ["textDocument/publishDiagnostics"] = function() end,
                },
            }

            -- Everything else (diagnostics, hover, references, etc.)
            opts.servers.basedpyright = {
                on_attach = function(client, _)
                    client.server_capabilities.completionProvider = false
                    client.server_capabilities.documentFormattingProvider = false
                    client.server_capabilities.documentRangeFormattingProvider = false
                end,
                settings = {
                    basedpyright = {
                        analysis = {
                            typeCheckingMode = "recommended",
                            autoSearchPaths = true,
                            useLibraryCodeForTypes = true,
                            diagnosticMode = "workspace",
                            disableOrganizeImports = true, -- let Ruff handle organizing imports
                        },
                    },
                },
            }
        end,
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
