-- Highlight and search for todo comments like TODO, HACK, BUG in your code base.
return {
  "folke/todo-comments.nvim",
  dependencies = { "nvim-lua/plenary.nvim" },
  opts = {
    colors = {
      error = { "DiagnosticError", "ErrorMsg", "#de5d68" },
      warning = { "DiagnosticWarning", "WarningMsg", "#eeb927" },
      info = { "DiagnosticInfo", "#57a5e5" },
      hint = { "DiagnosticHint", "#bb70d2" },
      default = { "Identifier", "#de5d68" },
    },
    -- keywords recognized as todo comments
    keywords = {
      FIX = {
        icon = "",                                  -- icon used for the sign, and in search results
        color = "error",                            -- can be a hex color, or a named color (see below)
        alt = { "FIXME", "BUG", "FIXIT", "ISSUE" }, -- a set of other keywords that all map to this FIX keywords
        -- signs = false, -- configure signs for some keywords individually
      },
      TODO = { icon = "", color = "info" },
      HACK = { icon = "", color = "warning" },
      WARN = { icon = "", color = "warning", alt = { "WARNING", "XXX" } },
      PERF = { icon = "", alt = { "OPTIM", "PERFORMANCE", "OPTIMIZE" } },
      NOTE = { icon = "", color = "hint", alt = { "INFO" } },
      TEST = { icon = "", color = "test", alt = { "TESTING", "PASSED", "FAILED" } },
    },
  },
}
