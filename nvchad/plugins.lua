local plugins = {

  {
    "christoomey/vim-tmux-navigator",
    lazy = false
  },

  {
    "jalvesaq/Nvim-R",
    ft = {"r", "quarto"},
    config = function()
      vim.cmd [[let R_rconsole_width = 0]]
      vim.cmd [[let R_nvimpager = "horizontal"]]
      -- Underscore will be replaced with the assign operator only if it is preceded
      -- by a space and followed by a non-word character
      vim.cmd [[let R_assign = 3]]
    end
  },

  {
    --Send code to command-line interpreter (REPL application)
    "jalvesaq/vimcmdline",
    ft = {"sh", "python", "snakemake"},
    config = function()
      vim.g.cmdline_map_start = "<LocalLeader>rf"
      vim.g.cmdline_map_send = "<LocalLeader>d"

      -- Define what application will be run as the interpreter for each 
      -- supported file type
      vim.g.cmdline_app = {
        sh = "bash",
        python = "ipython",
        snakemake = "ipython"
      }
    end
  },

  {
    "kshenoy/vim-signature",
    lazy = false
  },

  {
    "tpope/vim-surround",
    lazy = false
  },

  {
    "Lokaltog/vim-easymotion",
    lazy = false
  },

  {
    "zbirenbaum/copilot.lua",
    cmd = "Copilot",
    event = "InsertEnter",
    config = function()
      require("copilot").setup({
        suggestion = {
          enabled = true,
          auto_trigger = true,
          debounce = 75,
          keymap = {
            accept = "<M-l>",
            accept_word = false,
            accept_line = false,
            next = "<M-]>",
            prev = "<M-[>",
            dismiss = "<C-]>",
          },
        },
      })
    end,
  }
}

return plugins
