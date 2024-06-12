return {
	"CRAG666/code_runner.nvim",
	cmd = { "RunCode", "RunClose", "RunFile", "RunProject", "CRFileType", "CRProjects" },
	config = function()
		require("code_runner").setup({
			mode = "toggleterm",
			focus = true,
			startinsert = true,
			filetype = {
				cpp = {
					"cd $dir &&",
					"g++ $fileName -o $fileNameWithoutExt -std=c++17 -O2 -Wall -Wextra -pedantic -Wshadow -Wformat=2 -Wfloat-equal -Wconversion -Wlogical-op -Wshift-overflow=2 -Wduplicated-cond -Wcast-qual -Wcast-align -D_GLIBCXX_DEBUG -D_GLIBCXX_DEBUG_PEDANTIC -D_FORTIFY_SOURCE=2 &&",
					"./$fileNameWithoutExt"
				}
			}
		})
	end,
}
