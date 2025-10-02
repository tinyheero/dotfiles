require "nvchad.mappings"

-- add yours here

local map = vim.keymap.set

map("n", ";", ":", { desc = "CMD enter command mode" })
map("i", "jk", "<ESC>")

vim.keymap.set('n', '<LocalLeader>d', '<Plug>RDSendLine', { desc = 'Send to R the current line and move down to next line' })

-- map({ "n", "i", "v" }, "<C-s>", "<cmd> w <cr>")
