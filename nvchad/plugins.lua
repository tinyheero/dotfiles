local plugins = {

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
    "christoomey/vim-tmux-navigator",
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
