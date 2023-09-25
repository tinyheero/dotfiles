-- Options
vim.g.mapleader = ","                          -- <Leader> is set to ,
vim.opt.colorcolumn = { 80 }                   -- Vertical bar at x characters
vim.opt.relativenumber = true                  -- Relative line numbers from cursorline

-- Autocommands

-- Ensures that Snakefile files are set to the snakemake filetype. This allows
-- for the treesitter snakemake syntax highlighting to work
vim.api.nvim_create_autocmd(
  "BufRead", {
    pattern = "Snakefile",
    callback = function()
      vim.cmd "set filetype=snakemake"
    end
  }
)

