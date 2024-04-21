--[[ init.lua ]]

local fn = vim.fn
local install_path = fn.stdpath("data") .. "/site/pack/packer/start/packer.nvim"

if fn.empty(fn.glob(install_path)) > 0 then
  packer_bootstrap =
    fn.system({ "git", "clone", "--depth", "1", "https://github.com/wbthomason/packer.nvim", install_path })
end

require("plugins.packer") -- Install plugins
require("impatient") -- Impatient for faster loading
require("plugins.ui.rose-pine") -- Initialize theme

require("vars") -- Variables
require("opts") -- Options
require("keys") -- Keymaps

-- Setup plugins
require("plugins.ui.lualine")
require("plugins.ui.fidget")

require("plugins.comments.todo-comments")

require("plugins.completion.cmp")

require("plugins.debugger.dap")

require("plugins.folding.indent-blankline")

require("plugins.git.gitsigns")

require("plugins.highlights.nvim-treesitter")
require("plugins.highlights.headlines")

require("plugins.language-support.mason")
require("plugins.language-support.ale")

require("plugins.navigation.nvim-tree")
require("plugins.navigation.outline")
require("plugins.navigation.hop")
require("plugins.navigation.trouble")
require("plugins.navigation.telescope")
