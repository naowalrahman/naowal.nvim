return {
    "williamboman/mason-lspconfig.nvim",
    lazy = true,
    opts = {
        ensure_installed = {
            "pyright",
            "vtsls",
            "html",
            "cssls",
            "cssmodules_ls",
            "jsonls",
            "bashls",
            "jdtls",
            "emmet_ls",
            "marksman",
            "lua_ls",
        },
    },
}
