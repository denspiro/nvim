--[[ nvim-tree.lua ]]

require("nvim-tree").setup({
	sort_by = "case_sensitive",
	view = {
		adaptive_size = true,
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
					renamed = "♺ ",
					untracked = "! ",
					deleted = "🜔 ",
					ignored = "🝯 ",
				},
			},
		},
	},
})
