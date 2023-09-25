-- Options
vim.opt.backup = false                          -- creates a backup file
vim.opt.clipboard = "unnamedplus"               -- allows neovim to access the system clipboard
vim.opt.cmdheight = 1                           -- more space in the neovim command line for displaying messages
vim.g.mapleader = ","                          -- <Leader> is set to ,
vim.opt.colorcolumn = { 80 }                   -- Vertical bar at x characters
vim.opt.relativenumber = true                  -- Relative line numbers from cursorline

-- Autocommands

-- Ensures that Snakefile files are set to the snakemake filetype. This allows
-- for the treesitter snakemake syntax highlighting to work
vim.api.nvim_create_autocmd(
  {"BufRead", "BufNewFile"},
  {
    pattern = {"Snakefile", "*.smk"},
    callback = function()
      vim.cmd "set filetype=snakemake"
    end
  }
)

