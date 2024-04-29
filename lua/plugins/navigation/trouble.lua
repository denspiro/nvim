--[[ trouble.lua ]]

require("trouble").setup({
  position = "right",
  width = 75,
  padding = true,
  auto_preview = false,
  fold_open = "⏷",
  fold_closed = "⏵",
  icons = false,
  signs = {
    -- icons / text used for a diagnostic
    error = "E",
    warning = "W",
    hint = "H",
    information = "I",
  },
})
