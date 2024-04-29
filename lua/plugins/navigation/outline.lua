--[[ outline.lua ]]

require("outline").setup({
  symbols = {
    icon_fetcher = function(kind)
      return kind:sub(1, 3):lower()
    end,
  },
  symbol_folding = {
    markers = { "⏵", "⏷" },
  },
  preview_window = {
    live = true,
  },
})
