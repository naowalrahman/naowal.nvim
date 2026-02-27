return {
    "mason-org/mason-lspconfig.nvim",
    lazy = true,
    opts = {
        ensure_installed = {
            "pyrefly",
            "vtsls",
            "html",
            "cssls",
            "cssmodules_ls",
            "jsonls",
            "bashls",
            "jdtls",
            "emmet_ls",
            "marksman",
        },
    },
}
