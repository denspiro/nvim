--[[ opts.lua ]]
local opt = vim.opt -- with vim.opt we can set global, window and buffer settings, acting like :set in vimscript
local global = vim.g

-- ident
vim.cmd([[
set tabstop=4
set shiftwidth=4
set expandtab
set smartindent
]])

-- Spell check:
vim.cmd([[
set spelllang=en_us
]])

-- turn off macro reording
vim.cmd([[
map q <Nop>
]])

opt.number = true -- bool: Show line numbers
opt.relativenumber = false -- bool: Show relative line numbers
opt.scrolloff = 4 -- int:  Min num lines of context
opt.signcolumn = "yes" -- str:  Show the sign column
opt.numberwidth = 4 -- gutter width
opt.cursorline = true -- display cursor line
opt.cursorlineopt = "screenline" --
-- opt.laststatus = 3                  -- show just one status line

-- [[ Filetypes ]]
opt.encoding = "utf8" -- str:  String encoding to use
opt.fileencoding = "utf8" -- str:  File encoding to use

-- [[ Theme ]]
opt.syntax = "ON" -- str:  Allow syntax highlighting
opt.termguicolors = true -- bool: If term supports ui color then enable

-- [[ Search ]]
opt.ignorecase = true -- bool: Ignore case in search patterns
opt.smartcase = true -- bool: Override ignorecase if search contains capitals
opt.incsearch = true -- bool: Use incremental search
opt.hlsearch = false -- bool: Highlight search matches

-- [[ Whitespace ]]
opt.expandtab = true -- bool: Use spaces instead of tabs
opt.shiftwidth = 4 -- num:  Size of an indent
opt.softtabstop = 4 -- num:  Number of spaces tabs count for in insert mode
opt.tabstop = 4 -- num:  Number of spaces tabs count for

-- [[ Splits ]]
opt.splitright = true -- bool: Place new window to right of current one
opt.splitbelow = true -- bool: Place new window below the current one

opt.list = true
opt.listchars:append("space:⋅")
opt.listchars:append("eol:↴")

opt.clipboard = opt.clipboard + "unnamedplus"
opt.fillchars:append("vert: ")
opt.lazyredraw = true

opt.linebreak = true
opt.list = true
opt.breakindent = true
opt.updatetime = 300

opt.number = true
opt.numberwidth = 2
opt.ruler = true
opt.smartindent = true

-- Set edited buffers that aren't visible in a window somewhere
opt.hidden = true

-- Automatically refresh any files that haven't been edited by Vim
opt.autoread = true

-- Hightlight matching brackets
opt.showmatch = true

opt.cursorline = true

-- When indenting with '>', use 2 spaces width
opt.shiftwidth = 2

opt.tabstop = 2
opt.softtabstop = 2
opt.lcs = { tab = "––", space = "·" }

-- Start diff mode with vertical splits (unless explicitly specified otherwise).
opt.diffopt = opt.diffopt + "vertical"

global.better_whitespace_enabled = 1
global.strip_whitespace_on_save = 1

-- Disable netrw for nvim-tree to work properly
global.loaded_netrw = 1
global.loaded_netrwPlugin = 1

global.termguicolors = true

-- Leader key modifier
global.mapleader = " "

-- This prevents any regressions in filetype matching and ensures that filetypes are always detected
global.do_filetype_lua = 1

-- Treesitter folding
-- Prevent all fold when opening
-- opt.foldmethod = 'expr'
-- opt.foldexpr = 'nvim_treesitter#foldexpr()'
-- vim.cmd([[autocmd BufReadPost,FileReadPost * normal zR]])

-- fold opt.ings -- GOOOD!!!!!!!
-- vim.wo.foldmethod = "expr"
-- vim.wo.foldexpr = "nvim_treesitter#foldexpr()"
-- vim.wo.foldtext =
--     [[substitute(getline(v:foldstart),'\\t',repeat('\ ',&tabstop),'g').'...'.trim(getline(v:foldend)) ]]
-- vim.wo.fillchars = "fold:\\"
-- vim.wo.foldnestmax = 3
-- vim.wo.foldminlines = 1

-- Format on Save
vim.cmd([[autocmd BufWritePre * lua vim.lsp.buf.format()]])

-- Clear search highlights when leaving a buffer
vim.cmd([[
autocmd BufWinLeave * call clearmatches()
]])

-- Enable spell checking and set text width to 72 characters for git commit messages
vim.cmd([[
autocmd Filetype gitcommit setlocal spell textwidth=72
]])

-- Automatically open the quickfix window after running a grep command
vim.cmd([[
autocmd QuickFixCmdPost *grep* cwindow
]])

-- Close NERDTree if it's the only window left and it's a NERDTree tab
vim.cmd([[
autocmd bufenter * if (winnr("$") == 1 && exists("b:NERDTree") && b:NERDTree.isTabTree()) | q | endif
]])

-- Customize the appearance of spelling errors by underlining them
vim.cmd([[
hi clear SpellBad
hi SpellBad cterm=underline
]])

-- Set the color scheme to rose-pine
vim.cmd([[
colorscheme rose-pine
]])

-- Customize the appearance of indentation lines in the editor
-- Set the foreground color of the BlanklineIndent highlight group to a dark gray color (#1f1d2e)
-- Ensure that the highlight does not combine with other highlights for clarity
vim.cmd([[highlight BlanklineIndent guifg=#1f1d2e gui=nocombine]])

-- LSP Diagnostics Options Setup
local sign = function(opts)
  vim.fn.sign_define(opts.name, {
    texthl = opts.name,
    text = opts.text,
    numhl = "",
  })
end
sign({ name = "DiagnosticSignError", text = "E" })
sign({ name = "DiagnosticSignWarn", text = "W" })
sign({ name = "DiagnosticSignHint", text = "H" })
sign({ name = "DiagnosticSignInfo", text = "I" })

-- Inline error, warning, hint messages
vim.diagnostic.config({
  virtual_text = {
    prefix = "■", -- Could be '●', '▎', 'x'
  },
  signs = true,
  update_in_insert = true,
  underline = true,
  severity_sort = true,
  float = {
    border = "single",
    source = "always",
    header = "",
    prefix = "- ",
  },
})
