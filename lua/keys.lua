--[[ keys.lua ]]

-- Functional wrapper for mapping custom keybindings
-- mode (as in Vim modes like Normal/Insert mode)
-- lhs (the custom keybinds you need)
-- rhs (the commands or existing keybinds to customise)
-- opts (additional options like <silent>/<noremap>, see :h map-arguments for more info on it)
local function map(mode, lhs, rhs, opts)
  local options = { noremap = true }
  if opts then
    options = vim.tbl_extend("force", options, opts)
  end
  vim.api.nvim_set_keymap(mode, lhs, rhs, options)
end

-- Load all OPTs
map("n", "<F1>", ":luafile ~/.config/nvim/lua/opts.lua<cr>")

-- Enable spell checking
map("n", "<F2>", ":set spell!<cr>")
-- zg to add word
-- z= to correct error
-- new words  added to ~/.config/nvim/spell/en.utf-8.add

-- Quit buffer
map("n", "qq", ":q<cr>")
map("n", "qa", ":qa<cr>")

-- Reload buffer
map("n", "<C-a>", ":windo e!<CR>")

-- Copy to clipboard
map("v", "<leader>y", '"+y')
map("n", "<leader>Y", '"+yg_')
map("n", "<leader>y", '"+y')
map("n", "<leader>yy", '"+yy')

-- Paste from clipboard
map("n", "<leader>p", '"+p')
map("n", "<leader>P", '"+P')
map("v", "<leader>p", '"+p')
map("v", "<leader>P", '"+P')

-- Save and exit
map("n", "<leader>w", ":w<CR>")
map("n", "<leader>q", ":q<CR>")
map("n", "<leader>qa", ":qa<CR>")

-- Window navigation
map("n", "<C-j>", "<C-w>j<C-w>")
map("n", "<C-h>", "<C-w>h<C-w>")
map("n", "<C-k>", "<C-w>k<C-w>")
map("n", "<C-l>", "<C-w>l<C-w>")

-- Move lines up and down
map("n", "<C-j>", ":m .+1<CR>==")
map("n", "<C-k>", ":m .-2<CR>==")
map("i", "<C-j>", "<Esc>:m .+1<CR>==gi")
map("i", "<C-k>", "<Esc>:m .-2<CR>==gi")
map("v", "<C-j>", ":m '>+1<CR>gv=gv")
map("v", "<C-k>", ":m '<-2<CR>gv=gv")

-- Hop
map("n", "HH", ":HopWord<cr>")
map("n", "HF", ":HopPattern<cr>")
map("n", "HL", ":HopLineStart<cr>")

-- Telescope
map("n", "<leader>ff", ":lua require('telescope.builtin').find_files()<cr>")
map("n", "<leader>fm", ":Telescope media_files<cr>")
map("n", "<leader>fg", ":lua require('telescope.builtin').live_grep()<cr>")
map("n", "<leader>fb", ":lua require('telescope.builtin').buffers()<cr>")
map("n", "<leader>fh", ":lua require('telescope.builtin').help_tags()<cr>")
map("n", "<leader>fd", ":lua require('telescope.builtin').diagnostics()<cr>")
map("n", "<leader>fs", ":lua require('telescope.builtin').lsp_workspace_symbols()<cr>")
map("n", "<leader>fr", ":lua require('telescope.builtin').lsp_references()<cr>")
map("n", "<leader>fi", ":lua require('telescope.builtin').lsp_implementations()<cr>")
map("n", "<leader>fl", ":lua require('telescope.builtin').treesitter()<cr>")
map("n", "<leader>fk", ":lua require('telescope.builtin').keymaps()<cr>")

map("n", "<leader>fc", ":lua require('telescope.builtin').commands()<cr>")
map("n", "<leader>fch", ":lua require('telescope.builtin').command_history()<cr>")
map("n", "<leader>fo", ":lua require('telescope.builtin').oldfiles()<cr>")
map("n", "<leader>fmp", ":lua require('telescope.builtin').man_pages()<cr>")
map("n", "<leader>fgc", ":lua require('telescope.builtin').git_commits()<cr>")
map("n", "<leader>fgb", ":lua require('telescope.builtin').git_branches()<cr>")

-- Debugger
map("n", "<F12>", ":lua require('dap').continue()<cr>")
map("n", "<F11>", ":lua require('dap').step_into()<cr>")
map("n", "<F10>", ":lua require('dap').step_out()<cr>")
map("n", "<ESC>", ":lua require('dap').terminate()<cr>")
map("n", "B", ":lua require('dap').toggle_breakpoint()<cr>")

-- Todo List
map("n", "<leader>qf", ":TodoQuickFix<cr>")

-- Trouble
map("n", "<leader>t", ":TroubleToggle<cr>")

-- Nvim Tree
map("n", "<C-n>", ":NvimTreeToggle<CR>")

-- Transparency
map("n", "<leader>\\", ":TransparentToggle<CR>")

-- Toggle colored column at 81
map("n", "<leader>|", ':execute "set colorcolumn=" . (&colorcolumn == "" ? "81" : "")<CR>')

-- Navigate buffers
map("n", "<leader>bp", ":bprevious<CR>")
map("n", "<leader>bn", ":bnext<CR>")
map("n", "<leader>bf", ":bfirst<CR>")
map("n", "<leader>bl", ":blast<CR>")
map("n", "<leader>bd", ":bdelete<CR>")

-- Tagbar Toggle
-- map('n', "<leader>tt", ":TagbarToggle<CR>");
map("n", "<leader>tt", ":Outline<CR>")

-- LSP Navigation
-- Code Actions
map("n", "ca", ":lua vim.lsp.buf.code_action()<CR>")
map("n", "<c-]>", "<cmd>lua vim.lsp.buf.definition()<CR>")
map("n", "<c-k>", "<cmd>lua vim.lsp.buf.signature_help()<CR>")
map("n", "K", "<cmd>lua vim.lsp.buf.hover()<CR>")
map("n", "gi", "<cmd>lua vim.lsp.buf.implementation()<CR>")
map("n", "gc", "<cmd>lua vim.lsp.buf.incoming_calls()<CR>")
map("n", "gd", "<cmd>lua vim.lsp.buf.type_definition()<CR>")
map("n", "gr", "<cmd>lua vim.lsp.buf.references()<CR>")
map("n", "gn", "<cmd>lua vim.lsp.buf.rename()<CR>")
map("n", "gs", "<cmd>lua vim.lsp.buf.document_symbol()<CR>")
map("n", "gw", "<cmd>lua vim.lsp.buf.workspace_symbol()<CR>")

map("n", "g[", "<cmd>lua vim.diagnostic.goto_prev()<CR>")
map("n", "g]", "<cmd>lua vim.diagnostic.goto_next()<CR>")

-- See `:help vim.diagnostic.*` for documentation on any of the below functions
map("n", "<leader>e", "<cmd>lua vim.diagnostic.open_float()<CR>")
map("n", "[d", "<cmd>lua vim.diagnostic.goto_prev()<CR>")
map("n", "]d", "<cmd>lua vim.diagnostic.goto_next()<CR>")
map("n", "<leader>q", "<cmd>lua vim.diagnostic.setloclist()<CR>")

-- Crates Nvim
map("n", "<leader>ct", ":lua require('crates').toggle()<cr>")
map("n", "<leader>cr", ":lua require('crates').reload()<cr>")
map("n", "<leader>cv", ":lua require('crates').show_versions_popup()<cr>")
map("n", "<leader>cf", ":lua require('crates').show_features_popup()<cr>")
map("n", "<leader>cd", ":lua require('crates').show_dependencies_popup()<cr>")
map("n", "<leader>cu", ":lua require('crates').update_crate()<cr>")
map("n", "<leader>cU", ":lua require('crates').upgrade_crate()<cr>")
map("n", "<leader>cA", ":lua require('crates').upgrade_all_crates()<cr>")
map("n", "<leader>cH", ":lua require('crates').open_homepage()<cr>")
map("n", "<leader>cR", ":lua require('crates').open_repository()<cr>")
map("n", "<leader>cD", ":lua require('crates').open_documentation()<cr>")
map("n", "<leader>cC", ":lua require('crates').open_crates_io()<cr>")

-- Comment.nvim configuration
-- current line
map("n", "cc", "<Plug>(comment_toggle_linewise_current)")
map("n", "cb", "<Plug>(comment_toggle_blockwise_current)")

-- Toggle in VISUAL mode
map("x", "cc", "<Plug>(comment_toggle_linewise_visual)")
map("x", "cb", "<Plug>(comment_toggle_blockwise_visual)")
