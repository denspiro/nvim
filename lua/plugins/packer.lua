--[[ packer.lua ]]

return require("packer").startup(function()
  -- Comments
  use("numToStr/Comment.nvim") -- Enable comments
  use("folke/todo-comments.nvim") -- Todo comments

  -- Completion
  use("hrsh7th/nvim-cmp") -- Completion framework
  use("hrsh7th/cmp-nvim-lua") -- nvim-cmp source for neovim Lua API.
  use("hrsh7th/cmp-nvim-lsp") -- LSP completion source for nvim-cmp
  use("hrsh7th/cmp-nvim-lsp-signature-help")
  use("hrsh7th/cmp-vsnip") -- Snippet completion source for nvim-cmp
  use("hrsh7th/cmp-path") -- Useful completion sources
  use("hrsh7th/cmp-buffer") -- Useful completion sources
  use("L3MON4D3/LuaSnip") -- snippets for completion
  use("saadparwaiz1/cmp_luasnip") -- snippets for completion'
  use({
    "kylechui/nvim-surround", -- Surround selections
    tag = "*", -- Use for stability; omit to use `main` branch for the latest features
    config = function()
      require("nvim-surround").setup({})
    end,
  })
  use({
    "altermo/ultimate-autopair.nvim", -- Autopair on insert ( { "" } )
    event = { "InsertEnter", "CmdlineEnter" },
    branch = "v0.6", --recommended as each new version will have breaking changes
    config = function()
      require("ultimate-autopair").setup({})
    end,
  })

  -- Debugger
  use("mfussenegger/nvim-dap")
  use({ "rcarriga/nvim-dap-ui", requires = { "mfussenegger/nvim-dap", "nvim-neotest/nvim-nio" } })

  -- Folding
  use({ "kevinhwang91/nvim-ufo", requires = "kevinhwang91/promise-async" }) -- good folding
  use("lukas-reineke/indent-blankline.nvim") -- ident lines

  -- Git
  use("Xuyuanp/nerdtree-git-plugin") -- indicating file states like staged, unstaged, modified, or deleted directly within the NERDTree file explorer
  use("lewis6991/gitsigns.nvim") -- git decorations in editor
  use({
    "sindrets/diffview.nvim", -- Single tabpage interface for easily cycling through diffs for all modified files for any git rev.
    requires = "nvim-lua/plenary.nvim",
  })
  use({ "tpope/vim-fugitive" })
  use({
    "NeogitOrg/neogit", -- Git interface for neovim
    requires = {
      "nvim-lua/plenary.nvim", -- required
      "sindrets/diffview.nvim", -- optional - Diff integration
      "nvim-telescope/telescope.nvim",
    },
    config = function()
      require("neogit").setup({})
    end,
  })

  -- Highlights
  use({
    "nvim-treesitter/nvim-treesitter", -- Better syntax
    run = function()
      require("nvim-treesitter.install").update({ with_sync = true })
    end,
  })
  use({
    "nvim-treesitter/nvim-treesitter-textobjects", -- Syntax aware text-objects, select, move, swap, and peek support
    after = "nvim-treesitter",
    requires = "nvim-treesitter/nvim-treesitter",
  })
  use("m-demare/hlargs.nvim") -- Highlight argument definitions and usages
  use("neoclide/jsonc.vim") -- Syntax highlighting for CJSON
  use("ntpeters/vim-better-whitespace") -- Highlight all trailing whitespace characters
  use("chrisbra/Colorizer") -- Color highlight in CSS
  use("RRethy/vim-illuminate") -- Highlight other uses of word under cursor

  -- Language Support
  use("neovim/nvim-lspconfig") -- Collection of common configurations for the Nvim LSP client
  use("williamboman/mason.nvim") -- Manage LSPs and DAPs
  use("williamboman/mason-lspconfig.nvim") -- closes gaps with mason
  use({
    "saecki/crates.nvim", -- Help managing crates dependencies
    config = function()
      require("crates").setup({})
    end,
  })
  use("mrcjkb/rustaceanvim") -- rust-analyzer hints and more!
  use("nvim-lua/plenary.nvim") -- Collection of Lua functions
  use("stevearc/conform.nvim") -- Formatter
  use({
    "mfussenegger/nvim-lint", -- Linter
    config = function()
      -- Have to do the setup here because doing it in the dedicated file
      -- is difficult most probably because this plugin is optional and not always present
      require("lint").linters_by_ft = {
        javascript = { "eslint_d" },
        typescript = { "eslint_d" },
        typescriptreact = { "eslint_d" },
        tsx = { "eslint_d" },
        jsx = { "eslint_d" },
        scss = { "eslint_d" },
        css = { "eslint_d" },
        json = { "eslint_d" },
      }
    end,
  })
  use("folke/neodev.nvim") -- Neovim setup for init.lua and plugin development with full signature help, docs and completion for the nvim lua API

  -- Navigation
  use({
    "nvim-telescope/telescope.nvim", -- Fuzzy finder
    branch = "0.1.x",
    requires = { { "nvim-lua/plenary.nvim" } },
  })
  use({ "nvim-telescope/telescope-fzf-native.nvim", run = "make" }) -- Make telescope faster
  use("nvim-telescope/telescope-media-files.nvim") -- image files preview in telescope
  use("BurntSushi/ripgrep") -- Telescope grep
  use("hedyhli/outline.nvim") -- A sidebar with a tree-like outline of symbols from your code, powered by LSP
  use("nvim-tree/nvim-tree.lua") -- Filesystem navigation
  use({ "phaazon/hop.nvim", branch = "v2" }) -- Navitage to any word in the file
  use("folke/trouble.nvim") -- Summarizes issues

  -- Performance
  use("nvim-neotest/nvim-nio") -- Asynchronous IO in Neovim

  -- UI
  use({ "rose-pine/neovim", as = "rose-pine" }) -- theme
  use("goolord/alpha-nvim") -- fast and fully programmable greeter
  use("j-hui/fidget.nvim") -- shows status of nvim-lsp progress
  use("nvim-lualine/lualine.nvim") -- Statusline
  use("nvim-lua/popup.nvim") -- Poup for telescope
  use("nvim-tree/nvim-web-devicons")
end)
