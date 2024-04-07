return {
  "nvim-treesitter/nvim-treesitter",
  opts = function(_, opts)
    opts.ensure_installed = require("astrocore").list_insert_unique(opts.ensure_installed, {
      "c",
      "cpp",
      "css",
      "csv",
      "doxygen",
      "gitcommit",
      "gitignore",
      "java",
      "javascript",
      "json",
      "lua",
      "make",
      "markdown",
      "markdown_inline",
      "python",
      "vim",
    })
  end,
}
