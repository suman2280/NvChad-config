require("nvchad.configs.lspconfig").defaults()
--local lspconfig_util = require "lspconfig.util"
local on_attach = require("nvchad.configs.lspconfig").on_attach
local capabilities = require("nvchad.configs.lspconfig").capabilities

local servers = { "html", "cssls", "biome", "ts_ls" }
vim.lsp.enable(servers)

-- read :h vim.lsp.config for changing options of lsp servers

vim.diagnostic.config {
  virtual_text = {
    wrap = true,
  },
}

vim.lsp.config["biome"] = {
  cmd = { "biome", "lsp" },
  on_attach = on_attach,
  capabilities = capabilities,
  root_markers = { "biome.json", "biome.jsonc", "package.json", ".git" },
  filetypes = {
    "javascript",
    "javascriptreact",
    "typescript",
    "typescriptreact",
    "json",
    "jsonc",
    "css",
    "html",
    "graphql",
  },
}
