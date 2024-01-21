return {
	"CRAG666/code_runner.nvim",
	cmd = { "RunCode", "RunClose", "RunFile", "RunProject", "CRFileType", "CRProjects" },
	config = function()
		require("code_runner").setup({
			mode = "toggleterm",
			focus = true,
			startinsert = true,
		})
	end,
}
