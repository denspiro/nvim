-- Formatter plugin for Neovim
return {
  "stevearc/conform.nvim",
  event = { "BufWritePre" },
  cmd = { "ConformInfo" },
  opts = {
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
      rust = { "rustfmt" },
      c = { "clang-format" },
      sh = { "shfmt" },
    },
    format_on_save = {
      -- These options will be passed to conform.format()
      timeout_ms = 10000,
      lsp_fallback = true,
    },
  },
}
