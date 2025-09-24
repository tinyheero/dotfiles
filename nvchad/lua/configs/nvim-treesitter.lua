local options = {
  ensure_installed = {
    "bash",
    "markdown",
    "markdown_inline",
    "python",
    "r",
    "rnoweb",
    "snakemake",
    "yaml",
  },
  highlight = { enable = true },
}

require("nvim-treesitter.configs").setup(options)
