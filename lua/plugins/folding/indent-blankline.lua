--[[ indent-blankline.lua ]]

require("ibl").setup({
	scope = {
		highlight = "Operator",
		char = "┃",
		show_start = false,
	},
	indent = {
		highlight = "BlanklineIndent",
		char = "┃",
	},
})
