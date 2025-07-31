require("nvchad.configs.lspconfig").defaults()
local on_attach = require("nvchad.configs.lspconfig").on_attach
local capabilities = require("nvchad.configs.lspconfig").capabilities

local servers = { "html", "cssls", "gopls", "gofumpt", "golines", "goimports-reviser", "delve", "clangd", "clang-format", "codelldb", "pyright", "mypy", "ruff", "black", "debugpy", "typescript-language-server", "eslint-lsp", "prettier", "js-debug-adapter" }
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

lspconfig.clangd.setup {
  on_attach = function (client, bufnr)
    client.server_capabilities.signatureHelpProvide = false
    on_attach(client, bufnr)
  end,
  capabilities = capabilities,
}

lspconfig.pyright.setup {
  on_attach = on_attach,
  capabilities = capabilities,
  filetypes = {"python"},
}

local function organize_imports()
  vim.lsp.buf.execute_command({
    command = "_typescript.OrganizeImports",
    arguments = {vim.api.nvim_buf_get_name(0)},
  })
end

lspconfig.ts_ls.setup {
  on_attach = on_attach,
  capabilities = capabilities,
  init_options = {
    preferences = {
      disableSuggestions = true,
    }
  },
  commands = {
    OrganizeImports = {
      organize_imports,
      description = "Organize Imports",
    }
  }
}
