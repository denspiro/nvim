local alpha = require("alpha")
local dashboard = require("alpha.themes.dashboard")
local v = vim.version()

-- Set header
dashboard.section.header.val = {
  "                                                     ",
  "  ███╗   ██╗███████╗ ██████╗ ██╗   ██╗██╗███╗   ███╗ ",
  "  ████╗  ██║██╔════╝██╔═══██╗██║   ██║██║████╗ ████║ ",
  "  ██╔██╗ ██║█████╗  ██║   ██║██║   ██║██║██╔████╔██║ ",
  "  ██║╚██╗██║██╔══╝  ██║   ██║╚██╗ ██╔╝██║██║╚██╔╝██║ ",
  "  ██║ ╚████║███████╗╚██████╔╝ ╚████╔╝ ██║██║ ╚═╝ ██║ ",
  "  ╚═╝  ╚═══╝╚══════╝ ╚═════╝   ╚═══╝  ╚═╝╚═╝     ╚═╝ ",
  "                                                     ",
}

-- Set menu
dashboard.section.buttons.val = {
  dashboard.button("r", " Recent", ":Telescope oldfiles<CR>"),
  dashboard.button("e", " New file", ":ene <BAR> startinsert <CR>"),
  dashboard.button("s", " Settings", ":e $MYVIMRC | :cd %:p:h | split . | wincmd k | pwd<CR>"),
}

dashboard.section.footer.val = "v." .. v.major .. "." .. v.minor .. "." .. v.patch

-- Send config to alpha
alpha.setup(dashboard.opts)

-- Disable folding on alpha buffer
vim.cmd([[
    autocmd FileType alpha setlocal nofoldenable
]])
