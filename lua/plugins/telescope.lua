-- Fuzzy finder over lists.
-- Built on the latest awesome features from neovim core.
-- Telescope is centered around modularity, allowing for easy customization.
return {
  "nvim-telescope/telescope.nvim",
  dependencies = { "nvim-lua/plenary.nvim" },
  opts = {
    defaults = {
      color_devicons = false,
      file_ignore_patterns = {
        "^./.git/",
        "^./target/",
        "LICENSE*",
      },
      layout_strategy = "horizontal",
      layout_config = { height = 0.95, width = 0.95 },
    },
    extensions = {
      media_files = {
        -- filetypes whitelist
        -- defaults to {"png", "jpg", "mp4", "webm", "pdf"}
        filetypes = { "png", "webp", "jpg", "jpeg", "ppm", "pdf" },
        find_cmd = "rg", -- find command (defaults to `fd`)
      },
    },
  },
}
