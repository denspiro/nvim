-- Everforest is a green based color scheme;
-- it's designed to be warm and soft in order to protect developers' eyes.
return {
  "sainnhe/everforest",
  lazy = false,
  priority = 1000,
  config = function()
    -- Optionally configure and load the colorscheme
    -- directly inside the plugin declaration.
    vim.g.everforest_enable_italic = false
    vim.g.everforest_background = "hard"
    vim.cmd.colorscheme("everforest")
  end,
}
