-- EXAMPLE
local on_attach = require("nvchad.configs.lspconfig").on_attach
local on_init = require("nvchad.configs.lspconfig").on_init
local capabilities = require("nvchad.configs.lspconfig").capabilities

local lspconfig = require "lspconfig"
local servers = { "html", "cssls", "clangd", "sqls", "tsserver", "solargraph", "tailwindcss" }

-- lsps with default config
for _, lsp in ipairs(servers) do
  lspconfig[lsp].setup {
    on_attach = on_attach,
    on_init = on_init,
    capabilities = capabilities,
  }
end
-- tailwindcss
lspconfig.tailwindcss.setup {
  filetypes = {
    "erb",
    "eruby",
    "html",
    "css",
    "sass",
    "scss",
    "javascript",
    "javascriptreact",
    "typescript",
    "typescriptreact",
  },
  userLanguages = {
    eruby = "erb",
    templ = "html",
  },
}
-- typescript
lspconfig.tsserver.setup {}
-- solargraph
lspconfig.solargraph.setup {
  filetypes = { "ruby", "eruby", "gemfile", "rakefile" },
  settings = {
    solargraph = {
      diagnostics = true,
      completion = true,
      autoformat = true,
      formatting = true,
      folding = true,
      references = true,
      rename = true,
      symbols = true,
    },
  },
}
