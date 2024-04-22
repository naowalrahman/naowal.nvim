---@type LazySpec
return {
    "ray-x/lsp_signature.nvim",
    event = "BufRead",
    opts = {
        bind = true,
        handler_opts = { border = "rounded" },
        cursorhold_update = false,
    },
    config = function(_, opts) require("lsp_signature").setup(opts) end,
}
