require "nvchad.mappings"

-- add yours here

local map = vim.keymap.set

map("n", ";", ":", { desc = "CMD enter command mode" })
map("i", "jk", "<ESC>")

-- map({ "n", "i", "v" }, "<C-s>", "<cmd> w <cr>")

-- General mappings
-- Select all in neovim: in normal mode ggVG
map("i", "<C-CR>", "<Esc>o", { noremap = true, silent = true })
-- Nvim-dap mappings
map("n", "<leader>db", "<cmd>DapToggleBreakpoint<CR>", { desc = "DAP: Toggle Breakpoint" })
map("n", "<leader>dr", "<cmd>DapContinue<CR>", { desc = "Start or continue debugger" })
map("n", "<leader>dus", function()
    -- Ensure nvim-dap-ui is installed for widgets to be available
    local widgets = require("dap.ui.widgets")
    local sidebar = widgets.sidebar(widgets.scopes)
    sidebar.open()
  end, { desc = "DAP: Open Debugging Sidebar" })

-- Nvim-dap-go mappings
map("n", "<leader>dgt", function()
    require("dap-go").debug_test()
  end, { desc = "DAP-Go: Debug Go Test" })
map("n", "<leader>dgl", function()
    require("dap-go").debug_last()
  end, { desc = "DAP-Go: Debug Last Go Test" })

-- Nvim-dap-python mappings
map("n", "<leader>dpr", function ()
  require('dap-python').test_method()
end)

-- Gopher mappings
map("n", "<leader>gsj", "<cmd>GoTagAdd json<CR>", { desc = "Gopher: Add JSON struct tags" })
map("n", "<leader>gsy", "<cmd>GoTagAdd yaml<CR>", { desc = "Gopher: Add YAML struct tags" })

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
