local tree_cb = require("nvim-tree.config").nvim_tree_callback

require("nvim-tree").setup({
	disable_netrw = true,
	hijack_netrw = true,
	view = {
		width = 25,
		side = "left",
		preserve_window_proportions = false,
		number = false,
		relativenumber = false,
		signcolumn = "yes",
		mappings = {
			custom_only = false,
			list = {
				-- user mappings go here
			},
		},
	},
	git = {
		enable = true,
		ignore = false,
	},
})
