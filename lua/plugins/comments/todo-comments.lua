--[[ todo-comments.lua ]]

require("todo-comments").setup({
	colors = {
		error = { "DiagnosticError", "ErrorMsg", "#de5d68" },
		warning = { "DiagnosticWarning", "WarningMsg", "#eeb927" },
		info = { "DiagnosticInfo", "#57a5e5" },
		hint = { "DiagnosticHint", "#bb70d2" },
		default = { "Identifier", "#de5d68" },
	},
})
