--[[ outline.lua ]]

require("outline").setup({
  symbols = {
    icon_fetcher = function(kind)
      return kind:sub(1, 1)
    end,
  },
  symbol_folding = {

  },
  preview_window = {
    live = true,
  },
})
