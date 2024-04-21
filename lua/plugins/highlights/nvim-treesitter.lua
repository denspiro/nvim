--[[ nvim-treesitter.lua ]]

require("nvim-treesitter.configs").setup({
  ensure_installed = {
    "c",
    "lua",
    "vim",
    "vimdoc",
    "query",
    "javascript",
    "typescript",
    "rust",
    "tsx",
    "html",
    "sql",
  },
  sync_install = false,
  auto_install = true,
  highlight = {
    enable = true,
    -- Setting this to true will run `:h syntax` and tree-sitter at the same time.
    -- Set this to `true` if you depend on 'syntax' being enabled (like for indentation).
    -- Using this option may slow down your editor, and you may see some duplicate highlights.
    -- Instead of true it can also be a list of languages
    additional_vim_regex_highlighting = false,
  },
  incremental_selection = {
    enable = true,
    keymaps = {
      init_selection = "<S-Tab>", -- normal mode
      node_incremental = "<Tab>", -- visual mode
      node_decremental = "<S-Tab", -- visual mode
    },
  },
  ident = { enable = true },
  rainbow = {
    enable = true,
  },
})
