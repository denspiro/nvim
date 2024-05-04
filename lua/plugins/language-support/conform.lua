require('conform').setup({
  formatters_by_ft = {
    javascript = { "prettierd" },
    typescript = { "prettierd" },
    typescriptreact = { "prettierd" },
    tsx = { "prettierd" },
    jsx = { "prettierd" },
    scss = { "prettierd" },
    css = { "prettierd" },
    json = { "prettierd" },
    lua = { "stylua" },
  },
  format_on_save = {
    -- These options will be passed to conform.format()
    timeout_ms = 50,
    lsp_fallback = true,
  },
})
