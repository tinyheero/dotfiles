return {
  "nvim-treesitter/nvim-treesitter",
  run = ":TSUpdate",
  config = function ()
    require("nvim-treesitter.configs").setup({
      ensure_installed = {
        "bash", 
        "markdown",
        "markdown_inline",
        "r",
        "rnoweb",
        "snakemake",
        "yaml"
      },
      highlight = { enable = true },
    })
  end
}

