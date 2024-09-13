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
    "R-nvim/R.nvim",
    config = function ()
      -- Create a table with the options to be passed to setup()
      local opts = {
          hook = {
            on_filetype = function()
                vim.api.nvim_buf_set_keymap(0, "n", "<Enter>", "<Plug>RDSendLine", {})
                vim.api.nvim_buf_set_keymap(0, "v", "<Enter>", "<Plug>RSendSelection", {})
            end
          },
          R_args = {"--quiet", "--no-save"},
          min_editor_width = 72,
          rconsole_width = 78,
          disable_cmds = {
              "RClearConsole",
              "RCustomStart",
              "RSPlot",
              "RSaveClose",
            },
          }
          -- Check if the environment variable "R_AUTO_START" exists.
          -- If using fish shell, you could put in your config.fish:
          -- alias r "R_AUTO_START=true nvim"
          if vim.env.R_AUTO_START == "true" then
              opts.auto_start = 1
              opts.objbr_auto_start = true
          end
          require("r").setup(opts)
      end,
    lazy = false
  },
  {
    "nvim-treesitter/nvim-treesitter",
    run = ":TSUpdate",
    config = function ()
      require("nvim-treesitter.configs").setup({
        ensure_installed = {
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
  },
  {
    "hrsh7th/nvim-cmp",
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
    "R-nvim/cmp-r",
  }
}
