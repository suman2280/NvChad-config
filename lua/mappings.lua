require "nvchad.mappings"

-- add yours here

local map = vim.keymap.set

map("n", ";", ":", { desc = "CMD enter command mode" })
map("i", "jk", "<ESC>")

-- map({ "n", "i", "v" }, "<C-s>", "<cmd> w <cr>")

map("i", "<C-CR>", "<Esc>o", { noremap = true, silent = true })

-- tmux mappings
map("n", "<C-h>", "<cmd> TmuxNavigateLeft<CR>", { desc = "window left" })
map("n", "<C-l>", "<cmd> TmuxNavigateRight<CR>", { desc = "window right" })
map("n", "<C-j>", "<cmd> TmuxNavigateDown<CR>", { desc = "window down" })
map("n", "<C-k>", "<cmd> TmuxNavigateUp<CR>", { desc = "window up" })

-- Map <leader>ca to show LSP code actions in normal mode
map("n", "<leader>ca", function()
  vim.lsp.buf.code_action()
end, { desc = "LSP: Code Action" })

-- Visual mode mapping for range code actions
map("x", "<leader>ca", function()
  vim.lsp.buf.range_code_action()
end, { desc = "LSP: Range Code Action" })

-- Run previous command
map("n", "<C-CR>", "@:", { noremap = true, silent = true, desc = "Repeat last Ex command" })
