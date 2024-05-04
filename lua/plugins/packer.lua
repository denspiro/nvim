--[[ packer.lua ]]

return require("packer").startup(function()
  -- Comments
  use("numToStr/Comment.nvim")    -- Enable comments
  use("folke/todo-comments.nvim") -- Todo comments

  -- Completion
  use("hrsh7th/nvim-cmp")         -- Completion framework
  use("hrsh7th/cmp-nvim-lua")     -- nvim-cmp source for neovim Lua API.
  use("hrsh7th/cmp-nvim-lsp")     -- LSP completion source for nvim-cmp
  use("hrsh7th/cmp-nvim-lsp-signature-help")
  use("hrsh7th/cmp-vsnip")        -- Snippet completion source for nvim-cmp
  use("hrsh7th/cmp-path")         -- Useful completion sources
  use("hrsh7th/cmp-buffer")       -- Useful completion sources
  use("L3MON4D3/LuaSnip")         -- snippets for completion
  use("saadparwaiz1/cmp_luasnip") -- snippets for completion'
  use("folke/neodev.nvim")
  use({
    "kylechui/nvim-surround",
    tag = "*", -- Use for stability; omit to use `main` branch for the latest features
    config = function()
      require("nvim-surround").setup({})
    end,
  }) -- Surround selections
  use({
    "altermo/ultimate-autopair.nvim",
    event = { "InsertEnter", "CmdlineEnter" },
    branch = "v0.6", --recommended as each new version will have breaking changes
    config = function()
      require("ultimate-autopair").setup({})
    end,
  }) -- Autopair on insert ( { "" } )

  -- Debugger
  use("mfussenegger/nvim-dap")
  use({ "rcarriga/nvim-dap-ui", requires = { "mfussenegger/nvim-dap", "nvim-neotest/nvim-nio" } })

  -- Folding
  use({ "kevinhwang91/nvim-ufo", requires = "kevinhwang91/promise-async" }) -- good folding
  use("lukas-reineke/indent-blankline.nvim")                                -- ident lines

  -- Git
  use("tpope/vim-fugitive")                                             -- integrates Git into Vim, allowing Git commands to be executed within the editor
  use("Xuyuanp/nerdtree-git-plugin")                                    -- indicating file states like staged, unstaged, modified, or deleted directly within the NERDTree file explorer
  use("lewis6991/gitsigns.nvim")                                        -- git decorations in editor
  use({ "sindrets/diffview.nvim", requires = "nvim-lua/plenary.nvim" }) -- Single tabpage interface for easily cycling through diffs for all modified files for any git rev.
  use({
    "NeogitOrg/neogit",
    requires = {
      "nvim-lua/plenary.nvim",         -- required
      "sindrets/diffview.nvim",        -- optional - Diff integration
      "nvim-telescope/telescope.nvim", -- optional
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
  use("m-demare/hlargs.nvim")           -- Highlight argument definitions and usages
  use("neoclide/jsonc.vim")             -- Syntax highlighting for CJSON
  use("ntpeters/vim-better-whitespace") -- Highlight all trailing whitespace characters
  use("chrisbra/Colorizer")             -- Color highlight in CSS
  use("RRethy/vim-illuminate")          -- Highlight other uses of word under cursor

  -- Language Support
  use("neovim/nvim-lspconfig")             -- Collection of common configurations for the Nvim LSP client
  use("williamboman/mason.nvim")           -- Manage LSPs and DAPs
  use("williamboman/mason-lspconfig.nvim") -- closes gaps with mason
  use({
    "saecki/crates.nvim",
    config = function()
      require("crates").setup({})
    end,
  })                           -- Help managing crates dependencies
  use("mrcjkb/rustaceanvim")   -- rust-analyzer hints and more!
  use("nvim-lua/plenary.nvim") -- Collection of Lua functions
  use("stevearc/conform.nvim") -- Formatter
  use({
    "mfussenegger/nvim-lint",  -- Linter
    config = function()
      require("lint").linters_by_ft = {
        javascript = { "eslint_d" },
        typescript = { "eslint_d" },
        typescriptreact = { "eslint" },
        tsx = { "eslint" },
        jsx = { "eslint" },
        scss = { "eslint" },
        css = { "eslint" },
        json = { "eslint" },
      }
    end,
  })

  -- Navigation
  use({
    "nvim-telescope/telescope.nvim", -- Fuzzy finder
    branch = "0.1.x",
    requires = { { "nvim-lua/plenary.nvim" } },
  })
  use({ "nvim-telescope/telescope-fzf-native.nvim", run = "make" }) -- Make telescope faster
  use("nvim-telescope/telescope-media-files.nvim")                  -- image files preview in telescope
  use("BurntSushi/ripgrep")                                         -- Telescope grep
  use("hedyhli/outline.nvim")                                       -- A sidebar with a tree-like outline of symbols from your code, powered by LSP
  use("nvim-tree/nvim-tree.lua")                                    -- Filesystem navigation
  use({ "phaazon/hop.nvim", branch = "v2" })                        -- Navitage to any word in the file
  use("folke/trouble.nvim")                                         -- Summarizes issues

  -- Performance
  use("nvim-neotest/nvim-nio") -- Asynchronous IO in Neovim

  -- UI
  use({ "rose-pine/neovim", as = "rose-pine" }) -- theme
  use("goolord/alpha-nvim")                     -- fast and fully programmable greeter
  use("j-hui/fidget.nvim")                      -- shows status of nvim-lsp progress
  use("nvim-lualine/lualine.nvim")              -- Statusline
  use("nvim-lua/popup.nvim")                    -- Poup for telescope
end)
