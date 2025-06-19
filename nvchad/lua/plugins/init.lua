return {
  {
    "stevearc/conform.nvim",
    -- event = 'BufWritePre', -- uncomment for format on save
    opts = require "configs.conform",
  },

  -- These are some examples, uncomment them if you want to see them work!
  {
    "neovim/nvim-lspconfig",
    config = function()
      require "configs.lspconfig"
    end,
  },
  {
    "christoomey/vim-tmux-navigator",
    cmd = {
      "TmuxNavigateLeft",
      "TmuxNavigateDown",
      "TmuxNavigateUp",
      "TmuxNavigateRight",
      "TmuxNavigatePrevious",
    },
    keys = {
      { "<c-h>", "<cmd><C-U>TmuxNavigateLeft<cr>" },
      { "<c-j>", "<cmd><C-U>TmuxNavigateDown<cr>" },
      { "<c-k>", "<cmd><C-U>TmuxNavigateUp<cr>" },
      { "<c-l>", "<cmd><C-U>TmuxNavigateRight<cr>" },
      { "<c-\\>", "<cmd><C-U>TmuxNavigatePrevious<cr>" },
    },
    lazy = false
  },
  {
    "easymotion/vim-easymotion",
    lazy = false
  },
  {
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
    end,
    lazy = false
  },
  {
    "R-nvim/cmp-r",
  },
  {
    "hrsh7th/nvim-cmp",
    opts = function()
      function has_words_before()
          if vim.bo.buftype == 'prompt' then
              return false
          end
          local line, col = unpack(vim.api.nvim_win_get_cursor(0))
          -- stylua: ignore
          return col ~= 0 and vim.api.nvim_buf_get_lines(0, line - 1, line, true)[1]:sub(col, col):match('%s') == nil
      end
    end,
    config = function()
      local cmp = require("cmp")
      cmp.setup({
        sources = {{ name = "cmp_r" }},
        mapping = cmp.mapping.preset.insert({
          ['<CR>'] = cmp.mapping.confirm({ select = false }),
          -- During auto-completion, press <Tab> to select the next item.
          ['<Tab>'] = cmp.mapping(function(fallback)
            if cmp.visible() then
              cmp.select_next_item({ behavior = cmp.SelectBehavior.Insert })
            elseif has_words_before() then
              cmp.complete()
            else
              fallback()
            end
          end, { 'i', 's' }),
          ['<S-Tab>'] = cmp.mapping(function(fallback)
            if cmp.visible() then
              cmp.select_prev_item({ behavior = cmp.SelectBehavior.Insert })
            else
              fallback()
            end
          end, { 'i', 's' }),
        }),
      })
      require("cmp_r").setup({ })
    end,
  },
  {
    "zbirenbaum/copilot.lua",
    cmd = "Copilot",
    event = "InsertEnter",
    config = function()
      require("copilot").setup({
       suggestion = {
          auto_trigger = true,
        }
      })
    end,
  },
  {
    "chentoast/marks.nvim",
    event = "VeryLazy",
    opts = {},
  },
  {
    'stevearc/aerial.nvim',
    lazy = false,
    opts = {},
    -- Optional dependencies
    dependencies = {
       "nvim-treesitter/nvim-treesitter",
       "nvim-tree/nvim-web-devicons"
    },
  }
}
