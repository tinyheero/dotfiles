require "nvchad.options"

-- Relative line numbers from cursorline
vim.opt.relativenumber = true

-- Vertical bar at x characters
vim.opt.colorcolumn = { 80 }
vim.cmd [[highlight ColorColumn ctermbg=0 guibg=lightgrey]]

-- Autocommands

-- Ensures that Snakefile files are set to the snakemake filetype. This allows
-- for the treesitter snakemake syntax highlighting to work
vim.api.nvim_create_autocmd(
  {"BufRead", "BufNewFile"},
  {
    pattern = {"Snakefile", "*.smk"},
    callback = function()
      vim.cmd [[set filetype=snakemake]]
      vim.opt_local.tabstop = 4
      vim.opt_local.softtabstop = 4
      vim.opt_local.shiftwidth = 4
    end
  }
)
