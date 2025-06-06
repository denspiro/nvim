-- A blazing fast and easy to configure Neovim statusline written in Lua.
return {
  "nvim-lualine/lualine.nvim",
  opts = {
    options = {
      icons_enabled = true,
      theme = "auto",
      component_separators = { left = "", right = "" },
      section_separators = { left = "", right = "" },
      disabled_filetypes = {
        statusline = {},
        winbar = {},
      },
      ignore_focus = {},
      always_divide_middle = true,
      globalstatus = vim.go.laststatus == 3,
      refresh = {
        statusline = 1000,
        tabline = 1000,
        winbar = 1000,
      },
    },
    sections = {
      lualine_a = {
        {
          "branch",
          icon = "↳",
        },
      },
      lualine_b = {
        {
          "filename",
          path = 1,
          symbols = {
            readonly = "🔒",
          },
        },
        {
          "diagnostics",
          symbols = {
            error = "E",
            warn = "W",
            info = "I",
            hint = "H",
          },
        },
      },
      lualine_c = {},
      lualine_x = { "encoding", "filetype" },
      lualine_y = { "progress" },
      lualine_z = { "location" },
    },
    inactive_sections = {
      lualine_a = {},
      lualine_b = {},
      lualine_c = { "filename" },
      lualine_x = { "location" },
      lualine_y = {},
      lualine_z = {},
    },
    tabline = {},
    winbar = {},
    inactive_winbar = {},
    extensions = {},
  },
}
