return {
    "williamboman/mason-lspconfig.nvim",
    lazy = true,
    opts = {
        ensure_installed = {
            "bashls",
            "cssls",
            "cssmodules_ls",
            "emmet_ls",
            "quick_lint_js",
            "html",
            "jdtls",
            "jsonls",
            "marksman",
            "pyright",
        },
    },
}
