-- A pretty list for showing diagnostics, references, telescope results,
-- quickfix and location lists to help you solve all the trouble your code is causing.
return {
  "folke/trouble.nvim",
  cmd = "Trouble",
  opts = {
    position = "right",
    width = 75,
    padding = true,
    auto_preview = false,
    fold_open = "▼",
    fold_closed = "▶",
    signs = {
      -- icons / text used for a diagnostic
      error = "E",
      warning = "W",
      hint = "H",
      information = "I",
    },
  },
}
