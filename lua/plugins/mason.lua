-- Portable package manager for Neovim that runs everywhere Neovim runs.
-- Easily install and manage LSP servers, DAP servers, linters, and formatters.
return {
  "williamboman/mason.nvim",
  dependencies = {
    "neovim/nvim-lspconfig",
    "williamboman/mason-lspconfig.nvim",
    "WhoIsSethDaniel/mason-tool-installer.nvim",
  },
  config = function()
    require("mason").setup()
    require("mason-lspconfig").setup({
      automatic_installation = true,
      ensure_installed = {
        "cssls",
        "eslint",
        "html",
        "jsonls",
        "tailwindcss",
        "rust_analyzer",
        "typescript-language-server",
        "bashls",
        "sqlls",
        "lua_ls",
      },
    })

    require("mason-tool-installer").setup({
      ensure_installed = {
        "prettierd",
        "stylua", -- lua formatter
        "isort",  -- python formatter
        "black",  -- python formatter
        "shfmt",  -- bash script formatter
        "eslint_d",
      },
    })
  end,
}
