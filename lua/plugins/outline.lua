-- A sidebar with a tree-like outline of symbols from your code, powered by LSP.
return {
  "hedyhli/outline.nvim",
  lazy = true,
  cmd = { "Outline", "OutlineOpen" },
  keys = { -- Example mapping to toggle outline
    { "<leader>o", "<cmd>Outline<CR>", desc = "Toggle outline" },
  },
  opts = {
    symbols = {
      icon_fetcher = function(kind)
        return kind:sub(1, 3):lower()
      end,
    },
    symbol_folding = {
      markers = { "▶", "▼" },
    },
    preview_window = {
      live = true,
    },
  },
}
