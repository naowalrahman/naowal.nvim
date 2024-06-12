return {
	{
		"williamboman/mason-lspconfig.nvim",
		opts = {
			ensure_installed = {
				"bashls",
				"clangd",
				"cssls",
				"cssmodules_ls",
				"emmet_ls",
				"quick_lint_js",
				"html",
				"jdtls",
				"jsonls",
				"lua_ls",
				"marksman",
				"pyright",
			},
		},
	},
	{
		"jay-babu/mason-null-ls.nvim",
		opts = {
			ensure_installed = {
				"stylua",
				"clang-format",
			},
		},
	},
}
