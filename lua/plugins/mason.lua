return {
    "williamboman/mason-lspconfig.nvim",
    lazy = true,
    opts = {
        ensure_installed = {
            "bashls",
            "clangd",
            "cssls",
            "cssmodules_ls",
            "emmet_ls",
            "html",
            "jdtls",
            "jsonls",
            "lua_ls",
            "marksman",
            "pyright",
        },
    },
}
