-- Define the custom parser
local parser_config = require("nvim-treesitter.parsers").get_parser_configs()

-- Configure nextflow filetype
parser_config.nextflow = {
  install_info = {
    url = "https://github.com/matthuska/tree-sitter-nextflow",
    files = { "src/parser.c" },
    branch = "main",
  },
  filetype = "nextflow",
}

vim.filetype.add({
  extension = {
    nf = 'nextflow',
  }
})

local options = {
  ensure_installed = {
    "bash",
    "nextflow",
    "markdown",
    "markdown_inline",
    "python",
    "r",
    "rnoweb",
    "snakemake",
    "yaml"
  },
  highlight = { enable = true },
}

require("nvim-treesitter.configs").setup(options)
