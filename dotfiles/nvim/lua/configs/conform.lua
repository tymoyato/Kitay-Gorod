local conform = {}

conform = {
  formatters_by_ft = {
    lua = { "stylua" },
    eruby = { "erb_format" },
    sql = { "sql_formatter" },
    javascript = { { "prettierd", "prettier" } },
    css = { "prettier" },
    html = { "prettier" },
  },

  -- format_on_save = {
  --   -- These options will be passed to conform.format()
  --   timeout_ms = 500,
  --   lsp_fallback = true,
  -- },
}

return conform
