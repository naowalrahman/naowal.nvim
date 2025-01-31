return {
    "neovim/nvim-lspconfig",
    opts = function(_, opts)
        local architecture = vim.loop.os_uname().machine
        if architecture == "aarch64" then
            opts.servers.clangd.mason = false
            opts.servers.lua_ls.mason = false
        end
    end,
}
