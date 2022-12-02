local fn = vim.fn
local install_path = fn.stdpath('data')..'/site/pack/packer/start/packer.nvim'
if fn.empty(fn.glob(install_path)) > 0 then
  packer_bootstrap = fn.system({'git', 'clone', '--depth', '1', 'https://github.com/wbthomason/packer.nvim', install_path})
end

return require('packer').startup(function(use)
  use 'nvim-tree/nvim-tree.lua'
  use 'tpope/vim-surround'

  use({
    'denspiro/rose-pine',
    as = 'rose-pine',
    config = function()
      vim.cmd('colorscheme rose-pine')
    end
  })

  use 'nvim-treesitter/playground'

  use 'nvim-lualine/lualine.nvim'

  use 'lukas-reineke/indent-blankline.nvim'
  use 'nvim-treesitter/nvim-treesitter'

  -- Git
  use 'tpope/vim-fugitive'
  use 'Xuyuanp/nerdtree-git-plugin'

  -- Serching files
  use {
    'nvim-telescope/telescope.nvim', branch = '0.1.x',
    requires = {{ 'nvim-lua/plenary.nvim' }}
  }

  use 'neoclide/jsonc.vim'
  use 'pangloss/vim-javascript'

  use 'ntpeters/vim-better-whitespace'

  -- Color highlight in CSS
  use 'chrisbra/Colorizer'

  -- Highlight open and closed html tags
  use 'Valloric/MatchTagAlways'

  -- Git decorations
  use 'lewis6991/gitsigns.nvim'

  -- Highlight the word under the cursor
  use 'itchyny/vim-cursorword'

  -- LSP
  use 'neovim/nvim-lspconfig' -- Collection of configurations for built-in LSP client. To know the LSP name refer to https://github.com/neovim/nvim-lspconfig/blob/master/doc/server_configurations.md#configurations
  use 'hrsh7th/cmp-nvim-lsp' -- LSP source for nvim-cmp
  use 'saadparwaiz1/cmp_luasnip' -- Snippets source for nvim-cmp
  use 'L3MON4D3/LuaSnip' -- Snippets plugin
  use "williamboman/mason.nvim" -- Package manager for LSP servers, DAP servers, linters, and formatters
  use 'williamboman/mason-lspconfig.nvim'

  -- Useful completion sources:
  use 'hrsh7th/nvim-cmp' -- Autocompletion plugin
  use 'hrsh7th/cmp-nvim-lua'
  use 'hrsh7th/cmp-nvim-lsp-signature-help'
  use 'hrsh7th/cmp-vsnip'
  use 'hrsh7th/cmp-path'
  use 'hrsh7th/cmp-buffer'
  use 'hrsh7th/vim-vsnip'

  --[[
  Debug Adapter Protocol client implementation for Neovim. nvim-dap allows you to:
   * Launch an application to debug
   * Attach to running applications and debug them
   * Set breakpoints and step through code
   * Inspect the state of the application
  ]]
  use 'mfussenegger/nvim-dap'
  use { "rcarriga/nvim-dap-ui", requires = {"mfussenegger/nvim-dap"} }

  if packer_bootstrap then
    require('packer').sync()
  end

  -- Leader key modifier
  vim.g.mapleader = " "

  require('gitsigns').setup({
    signs = {
      add          = { hl = 'GitSignsAdd'   , text = '+', numhl='GitSignsAddNr'   , linehl='GitSignsAddLn'    },
      change       = { hl = 'GitSignsChange', text = '~', numhl='GitSignsChangeNr', linehl='GitSignsChangeLn' },
      delete       = { hl = 'GitSignsDelete', text = '_', numhl='GitSignsDeleteNr', linehl='GitSignsDeleteLn' },
      topdelete    = { hl = 'GitSignsDelete', text = '‾', numhl='GitSignsDeleteNr', linehl='GitSignsDeleteLn' },
      changedelete = { hl = 'GitSignsChange', text = '~', numhl='GitSignsChangeNr', linehl='GitSignsChangeLn' },
      untracked    = { hl = 'GitSignsAdd'   , text = '!', numhl='GitSignsAddNr'   , linehl='GitSignsAddLn'    },
    },

    on_attach = function(bufnr)
      local gs = package.loaded.gitsigns

      local function map(mode, l, r, opts)
        opts = opts or {}
        opts.buffer = bufnr
        vim.keymap.set(mode, l, r, opts)
      end

      -- Navigation
      map('n', ']c', function()
        if vim.wo.diff then return ']c' end
        vim.schedule(function() gs.next_hunk() end)
        return '<Ignore>'
      end, {expr=true})

      map('n', '[c', function()
        if vim.wo.diff then return '[c' end
        vim.schedule(function() gs.prev_hunk() end)
        return '<Ignore>'
      end, {expr=true})

      -- Actions
      map({'n', 'v'}, '<leader>hs', ':Gitsigns stage_hunk<CR>')
      map({'n', 'v'}, '<C-x>', ':Gitsigns reset_hunk<CR>')
      map('n', '<leader>hS', gs.stage_buffer)
      map('n', '<leader>hu', gs.undo_stage_hunk)
      map('n', '<leader>hR', gs.reset_buffer)
      map('n', '<C-o>', gs.preview_hunk)
      map('n', '<leader>hb', function() gs.blame_line{full=true} end)
      map('n', '<C-b>', gs.toggle_current_line_blame)
      map('n', '<leader>hd', gs.diffthis)
      map('n', '<leader>hD', function() gs.diffthis('~') end)
      map('n', '<leader>td', gs.toggle_deleted)

      -- Text object
      map({'o', 'x'}, 'ih', ':<C-U>Gitsigns select_hunk<CR>')
    end
  })

  local builtin = require('telescope.builtin')
  vim.keymap.set('n', '<leader>ff', builtin.find_files, {})
  vim.keymap.set('n', '<leader>fg', builtin.live_grep, {})
  vim.keymap.set('n', '<leader>fs', builtin.grep_string, {})
  vim.keymap.set('n', '<leader>fb', builtin.buffers, {})
  vim.keymap.set('n', '<leader>fh', builtin.help_tags, {})
  vim.keymap.set('n', '<leader>fo', builtin.oldfiles, {})

  require("lualine").setup({
    options = {
      icons_enabled = true,
      theme = 'auto',
      component_separators = { left = '', right = '' },
      section_separators = { left = '', right = '' },
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
          'branch',
          icon = '↳'
        }
      },
      lualine_b = {
        {
         'filename',
          path = 1,
          symbols = {
            readonly = '🔒'
          }
        },
        {
          'diagnostics',
          symbols = {
            error = 'E ',
            warn = 'W ',
            info = 'i ',
            hint = '⚡'
          }
        }
      },
      lualine_c = {},
      lualine_x = { 'encoding', 'filetype' },
      lualine_y = { 'progress' },
      lualine_z = { 'location' },
    },
    inactive_sections = {
      lualine_a = {},
      lualine_b = {},
      lualine_c = { 'filename' },
      lualine_x = { 'location' },
      lualine_y = {},
      lualine_z = {},
    },
    tabline = {},
    winbar = {},
    inactive_winbar = {},
    extensions = {},
  })

  -- Disable netrw for nvim-tree to work properly
  vim.g.loaded_netrw = 1
  vim.g.loaded_netrwPlugin = 1
  require("nvim-tree").setup({
    sort_by = "case_sensitive",
    view = {
      adaptive_size = true,
      mappings = {
        list = {
          { key = "u", action = "dir_up" },
        },
      },
    },
    git = {
      ignore = false,
    },
    renderer = {
      group_empty = true,
      indent_markers = {
        enable = false,
        inline_arrows = true,
        icons = {
          corner = "",
          edge = "",
          item = "",
          bottom = "",
          none = "",
        },
      },
      icons = {
        webdev_colors = true,
        git_placement = "before",
        padding = "",
        symlink_arrow = " → ",
        show = {
          file = true,
          folder = true,
          folder_arrow = true,
          git = true,
        },
        glyphs = {
          default = "",
          symlink = "⮀ ",
          bookmark = "",
          folder = {
            arrow_closed = "⏵",
            arrow_open = "⏷",
            default = "",
            open = "",
            empty = "",
            empty_open = "",
            symlink = "",
            symlink_open = "",
          },
          git = {
            unstaged = "+ ",
            staged = "✓ ",
            unmerged = "⇆ ",
            renamed = "r ",
            untracked = "u ",
            deleted = "d ",
            ignored = "i ",
          },
        },
      },
    },
  })

  vim.opt.list = true
  vim.opt.listchars:append "space:⋅"
  vim.opt.listchars:append "eol:↴"

  require("indent_blankline").setup({
    char = '',
    context_char = '┃',
    char_list = {},
    use_treesitter = true,
    show_current_context = true,
    show_current_context_start = false,
  })

  -- Setting up Mason for LSP, DAP etc.
  require("mason").setup()
  require("mason-lspconfig").setup({
      -- A list of servers to automatically install if they're not already installed. Example: { "rust_analyzer@nightly", "sumneko_lua" }
      -- This setting has no relation with the `automatic_installation` setting.
      ensure_installed = { "rust_analyzer", "angularls", "tsserver", "bashls" }

      -- Whether servers that are set up (via lspconfig) should be automatically installed if they're not already installed.
      -- This setting has no relation with the `ensure_installed` setting.
      -- Can either be:
      --   - false: Servers are not automatically installed.
      --   - true: All servers set up via lspconfig are automatically installed.
      --   - { exclude: string[] }: All servers set up via lspconfig, except the ones provided in the list, are automatically installed.
      --       Example: automatic_installation = { exclude = { "rust_analyzer", "solargraph" } }
      -- automatic_installation = false,
  })

  -- Debugger settings
  local dapui = require("dapui")
  local dap = require('dap')

  dap.adapters.lldb = {
    type = 'server',
    name = 'lldb',
    port = '${port}',
    executable = {
      -- CHANGE THIS to your path!
      command = 'codelldb', -- adjust as needed, must be absolute path
      args = {"--port", "${port}"},
    }
  }

  dap.configurations.cpp = {
    {
      name = 'Launch',
      type = 'lldb',
      request = 'launch',
      program = function()
        return vim.fn.input('Path to executable: ', vim.fn.getcwd() .. '/target/debug/', 'file')
      end,
      cwd = '${workspaceFolder}',
      stopOnEntry = false,
      args = {},
      -- 💀
      -- if you change `runInTerminal` to true, you might need to change the yama/ptrace_scope setting:
      --
      --    echo 0 | sudo tee /proc/sys/kernel/yama/ptrace_scope
      --
      -- Otherwise you might get the following error:
      --
      --    Error on launch: Failed to attach to the target process
      --
      -- But you should be aware of the implications:
      -- https://www.kernel.org/doc/html/latest/admin-guide/LSM/Yama.html
      initCommand = {},
      runInTerminal = false,
    },
  }

  dap.configurations.c = dap.configurations.cpp
  dap.configurations.rust = dap.configurations.cpp

  dap.listeners.after.event_initialized["dapui_config"] = function()
    dapui.open()
  end
  dap.listeners.before.event_terminated["dapui_config"] = function()
    dapui.close()
  end
  dap.listeners.before.event_exited["dapui_config"] = function()
    dapui.close()
  end

  require("dapui").setup({
    icons = { expanded = "-", collapsed = "+", current_frame = "→" },
    mappings = {
      -- Use a table to apply multiple mappings
      expand = { "<CR>", "<2-LeftMouse>" },
      open = "o",
      remove = "d",
      edit = "e",
      repl = "r",
      toggle = "t",
    },
    -- Expand lines larger than the window
    -- Requires >= 0.7
    expand_lines = vim.fn.has("nvim-0.7") == 1,
    -- Layouts define sections of the screen to place windows.
    -- The position can be "left", "right", "top" or "bottom".
    -- The size specifies the height/width depending on position. It can be an Int
    -- or a Float. Integer specifies height/width directly (i.e. 20 lines/columns) while
    -- Float value specifies percentage (i.e. 0.3 - 30% of available lines/columns)
    -- Elements are the elements shown in the layout (in order).
    -- Layouts are opened in order so that earlier layouts take priority in window sizing.
    layouts = {
      {
        elements = {
        -- Elements can be strings or table with id and size keys.
          { id = "scopes", size = 0.25 },
          "breakpoints",
          "stacks",
          "watches",
        },
        size = 60,
        position = "right",
      },
      {
        elements = {
          "repl",
          "console",
        },
        size = 0.25, -- 25% of total lines
        position = "bottom",
      },
    },
    controls = {
      -- Requires Neovim nightly (or 0.8 when released)
      enabled = true,
      -- Display controls in this element
      element = "repl",
      icons = {
        pause = "pause",
        play = "play",
        step_into = "step_into",
        step_over = "step_over",
        step_out = "step_out",
        step_back = "step_back",
        run_last = "run_last",
        terminate = "terminate",
      },
    },
    floating = {
      max_height = nil, -- These can be integers or a float between 0 and 1.
      max_width = nil, -- Floats will be treated as percentage of your screen.
      border = "single", -- Border style. Can be "single", "double" or "rounded"
      mappings = {
        close = { "q", "<Esc>" },
      },
    },
    windows = { indent = 1 },
    render = {
      max_type_length = nil, -- Can be integer or nil.
      max_value_lines = 100, -- Can be integer or nil.
    }
  })

  -- Add additional capabilities supported by nvim-cmp
  local capabilities = vim.lsp.protocol.make_client_capabilities()
  capabilities = require('cmp_nvim_lsp').default_capabilities(capabilities)

  local lspconfig = require('lspconfig')

  -- luasnip setup
  local luasnip = require('luasnip')

  -- nvim-cmp setup
  local cmp = require('cmp')
  cmp.setup {
    snippet = {
      expand = function(args)
        luasnip.lsp_expand(args.body)
      end,
    },
    mapping = cmp.mapping.preset.insert({
      ['<C-d>'] = cmp.mapping.scroll_docs(-4),
      ['<C-f>'] = cmp.mapping.scroll_docs(4),
      ['<C-Space>'] = cmp.mapping.complete(),
      ['<CR>'] = cmp.mapping.confirm {
        behavior = cmp.ConfirmBehavior.Replace,
        select = true,
      },
      ['<Tab>'] = cmp.mapping(function(fallback)
        if cmp.visible() then
          cmp.select_next_item()
        elseif luasnip.expand_or_jumpable() then
          luasnip.expand_or_jump()
        else
          fallback()
        end
      end, { 'i', 's' }),
      ['<S-Tab>'] = cmp.mapping(function(fallback)
        if cmp.visible() then
          cmp.select_prev_item()
        elseif luasnip.jumpable(-1) then
          luasnip.jump(-1)
        else
          fallback()
        end
      end, { 'i', 's' }),
    }),
    sources = {
      { name = "luasnip" },
      { name = 'path' },                              -- file paths
      { name = 'nvim_lsp' },                          -- from language server
      { name = 'nvim_lsp_signature_help' },           -- display function signatures with current parameter emphasized
      { name = 'nvim_lua' },                          -- complete neovim's Lua runtime API such vim.lsp.*
      { name = 'buffer' },                            -- source current buffer
      { name = 'vsnip' },                             -- nvim-cmp source for vim-vsnip
      { name = 'calc' },
    },
    formatting = {
      fields = {'abbr', 'kind', 'menu'},
      format = function(entry, item)
        local mode = "symbol_text"
        local menu = {
          nvim_lsp = '[lsp]',
          vsnip = '[snp]',
          buffer = '[buf]',
          path = '[pth]',
        }
        item.menu = menu[entry.source.name]
        return item
      end,
    },
  }

  local lsp_flags = {
    -- This is the default in Nvim 0.7+
    debounce_text_changes = 150,
  }

  -- Use an on_attach function to only map the following keys
  -- after the language server attaches to the current buffer
  local on_attach = function(client, bufnr)
    -- Enable completion triggered by <c-x><c-o>
    vim.api.nvim_buf_set_option(bufnr, 'omnifunc', 'v:lua.vim.lsp.omnifunc')

    -- Mappings.
    -- See `:help vim.lsp.*` for documentation on any of the below functions
    local bufopts = { noremap=true, silent=true, buffer=bufnr }
    vim.keymap.set('n', 'gD', vim.lsp.buf.declaration, bufopts)
    vim.keymap.set('n', 'gd', vim.lsp.buf.definition, bufopts)
    vim.keymap.set('n', 'K', vim.lsp.buf.hover, bufopts)
    vim.keymap.set('n', 'gi', vim.lsp.buf.implementation, bufopts)
    vim.keymap.set('n', '<C-k>', vim.lsp.buf.signature_help, bufopts)
    vim.keymap.set('n', '<space>wa', vim.lsp.buf.add_workspace_folder, bufopts)
    vim.keymap.set('n', '<space>wr', vim.lsp.buf.remove_workspace_folder, bufopts)
    vim.keymap.set('n', '<space>wl', function()
      print(vim.inspect(vim.lsp.buf.list_workspace_folders()))
    end, bufopts)
    vim.keymap.set('n', '<space>D', vim.lsp.buf.type_definition, bufopts)
    vim.keymap.set('n', '<space>rn', vim.lsp.buf.rename, bufopts)
    vim.keymap.set('n', '<space>ca', vim.lsp.buf.code_action, bufopts)
    vim.keymap.set('n', 'gr', vim.lsp.buf.references, bufopts)
    vim.keymap.set('n', '<space>f', function() vim.lsp.buf.format { async = true } end, bufopts)
  end

  for _, ls in ipairs({'bashls', 'angularls', 'tsserver', 'rust_analyzer'}) do
    require('lspconfig')[ls].setup{
      on_attach = on_attach,
      flags = lsp_flags,
    }
  end

  -- Mappings.
  local keybind = vim.keymap.set
  local opts = { noremap=true, silent=true }

  -- See `:help vim.diagnostic.*` for documentation on any of the below functions
  keybind('n', '<leader>e', vim.diagnostic.open_float, opts)
  keybind('n', '[d', vim.diagnostic.goto_prev, opts)
  keybind('n', ']d', vim.diagnostic.goto_next, opts)
  keybind('n', '<leader>q', vim.diagnostic.setloclist, opts)

  -- Debugger
  keybind('n', '<F12>', dap.continue, opts)
  keybind('n', '<F11>', dap.step_into, opts)
  keybind('n', '<F10>', dap.step_out, opts)
  keybind('n', '<ESC>', dap.terminate, opts)
  keybind('n', 'B', dap.toggle_breakpoint, opts)

  -- Reload buffer
  keybind('n', '<C-a>', ':windo e!<CR>')

  -- Move lines up and down
  keybind('n', '<C-j>', ':m .+1<CR>==', opts)
  keybind('n', '<C-k>', ':m .-2<CR>==', opts)
  keybind('i', '<C-j>', '<Esc>:m .+1<CR>==gi', opts)
  keybind('i', '<C-k>', '<Esc>:m .-2<CR>==gi', opts)
  keybind('v', '<C-j>', ":m '>+1<CR>gv=gv", opts)
  keybind('v', '<C-k>', ":m '<-2<CR>gv=gv", opts)

  -- NvimTree
  keybind('n', '<C-n>', ':NvimTreeToggle<CR>', opts)

  vim.opt.clipboard = vim.opt.clipboard + 'unnamedplus'
  vim.opt.fillchars:append('vert: ')
  vim.opt.lazyredraw = true

  vim.opt.linebreak = true
  vim.opt.list = true
  vim.opt.breakindent = true
  vim.opt.updatetime = 300

  vim.opt.number = true
  vim.opt.numberwidth = 2
  vim.opt.ruler = true
  vim.opt.smartindent = true

  -- Set edited buffers that aren't visible in a window somewhere
  vim.opt.hidden = true

  -- Automatically refresh any files that haven't been edited by Vim
  vim.opt.autoread = true

  -- Hightlight matching brackets
  vim.opt.showmatch = true

  vim.opt.cursorline = true
  vim.opt.expandtab = true

  -- When indenting with '>', use 2 spaces width
  vim.opt.shiftwidth = 2

  vim.opt.tabstop = 2
  vim.opt.softtabstop = 2
  vim.opt.lcs = { tab = '––', space = '·' }

  -- Start diff mode with vertical splits (unless explicitly specified otherwise).
  vim.opt.diffopt = vim.opt.diffopt + 'vertical'

  vim.g.better_whitespace_enabled=1
  vim.g.strip_whitespace_on_save=1

  function remap(mode, lhs, rhs, opts)
    local options = { noremap = true }
    if opts then
      options = vim.tbl_extend("force", options, opts)
    end
    vim.api.nvim_set_keymap(mode, lhs, rhs, options)
  end

  remap('i', '"', '""<left>')
  remap('i', "'", "''<left>")
  remap('i', '(', '()<left>')
  remap('i', '[', '[]<left>')
  remap('i', '{', '{}<left>')
  remap('i', '{<CR>', '{<CR>}<ESC>O')
  remap('i', '{;<CR>', '{<CR>};<ESC>O')

  vim.cmd[[
    autocmd BufWinLeave * call clearmatches()
    autocmd Filetype gitcommit setlocal spell textwidth=72
    autocmd QuickFixCmdPost *grep* cwindow
    autocmd bufenter * if (winnr("$") == 1 && exists("b:NERDTree") && b:NERDTree.isTabTree()) | q | endif
    hi clear SpellBad
    hi SpellBad cterm=underline
  ]]

end)
