require("nvchad.configs.lspconfig").defaults()
local on_attach = require("nvchad.configs.lspconfig").on_attach
local capabilities = require("nvchad.configs.lspconfig").capabilities

local servers = { "html", "cssls", "gopls", "gofumpt", "golines", "goimports-reviser", "delve" }
vim.lsp.enable(servers)

-- read :h vim.lsp.config for changing options of lsp servers 
local lspconfig = require("lspconfig")
local util = require "lspconfig/util"

lspconfig.gopls.setup {
  on_attach = on_attach,
  capabilities = capabilities,
  cmd = {"gopls"},
  filetypes = { "go", "gomod", "gowork", "gotmpl" },
  root_dir = util.root_pattern("go.work", "go.mod", ".git"),
  settings = {
    gopls = {
      completeUnimported = true,
      usePlaceholders = true,
      experimentalPostfixCompletions = true,
      analyses = {
        unusedparams = true,
      },
    },
  },
}
