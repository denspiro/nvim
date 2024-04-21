--[[ ale.lua ]]

vim.g.ale_fixers = {
	["javascript"] = { "prettier" },
	["typescript"] = { "prettier" },
	["typescriptreact"] = { "prettier" },
	["tsx"] = { "prettier" },
	["jsx"] = { "prettier" },
	["scss"] = { "prettier" },
	["css"] = { "prettier" },
	["json"] = { "prettier" },
	["lua"] = { "stylua" },
}

vim.g.ale_linters = {
	["javascript"] = { "eslint" },
	["typescript"] = { "eslint" },
	["typescriptreact"] = { "eslint" },
	["tsx"] = { "eslint" },
	["jsx"] = { "eslint" },
	["scss"] = { "eslint" },
	["css"] = { "eslint" },
	["json"] = { "eslint" },
}

vim.g.ale_lua_stylua_executable = "stylua"
vim.g.ale_fix_on_save = 1
vim.g.ale_linters_explicit = 1
vim.g.ale_echo_cursor = 0
