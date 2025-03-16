-- Extensible UI for Neovim notifications and LSP progress messages.
return {
  "j-hui/fidget.nvim",
  opts = {
    notification = {
      -- Options related to the notification window and buffer
      window = {
        align = "top", -- How to align the notification window
      },
    },
  },
}
