--[[ rose-pine.lua ]]

require("rose-pine").setup({
  --- @usage 'auto'|'main'|'moon'|'dawn'
  variant = "auto",
  --- @usage 'main'|'moon'|'dawn'
  dark_variant = "main",
  dim_inactive_windows = false,

  styles = {
    bold_vert_split = false,
    italic = false,
    transparency = true,
  },

  --- @usage string hex value or named color from rosepinetheme.com/palette
  groups = {
    background = "base",
    background_nc = "_experimental_nc",
    panel = "surface",
    panel_nc = "base",
    border = "highlight_med",
    comment = "muted",
    link = "iris",
    punctuation = "subtle",

    error = "love",
    hint = "iris",
    info = "foam",
    warn = "gold",

    headings = {
      h1 = "iris",
      h2 = "foam",
      h3 = "rose",
      h4 = "gold",
      h5 = "pine",
      h6 = "foam",
    },
    -- or set all headings at once
    -- headings = 'subtle'
  },

  -- Change specific vim highlight groups
  -- https://github.com/rose-pine/neovim/wiki/Recipes
  highlight_groups = {
    ColorColumn = { bg = "rose" },
    -- Blend colours against the "base" background
    CursorLine = { bg = "foam", blend = 10 },
    StatusLine = { fg = "pine", bg = "pine", blend = 10 },
    NonText = { fg = "#a6258d" },
    IlluminatedWordText = { bg = "overlay" },
    IlluminatedWordRead = { bg = "#38195d" },
    Pmenu = { bg = "surface" },
    CmpNormal = { bg = "surface" },
    CmpDocNormal = { bg = "surface" },
    -- By default each group adds to the existing config.
    -- If you only want to set what is written in this config exactly,
    -- you can set the inherit option:
    -- Search = { bg = 'gold', inherit = false },
  },
})
