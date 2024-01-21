local servers = {
	"autopep8",
	"bashls",
	"clang-format",
	"clangd",
	"cssls",
	"cssmodules_ls",
	"emmet_ls",
	"eslint",
	"html",
	"jdtls",
	"jsonls",
	"lua_ls",
	"marksman",
	"pyright",
	"stylua",
}

return {
	"williamboman/mason-lspconfig.nvim",
	config = function(plugin, opts)
		require("plugins.configs.mason-lspconfig")(plugin, opts)
		opts.ensure_intalled = servers
		opts.automatic_installation = true

		-- local lspconfig = require("lspconfig")
		-- local options = {}
		-- for _, server in pairs(servers) do
		-- 	options = {
		-- 		on_attach = require("user.lsp.handlers").on_attach,
		-- 		capabilities = require("user.lsp.handlers").capabilities,
		-- 	}
		--
		-- 	server = vim.split(server, "@")[1]
		--
		-- 	local conf_opts = require("user.lsp.settings." .. server)
		-- 	options = vim.tbl_deep_extend("force", conf_opts, options)
		--
		-- 	lspconfig[server].setup(opts)
		-- end
	end,
}
