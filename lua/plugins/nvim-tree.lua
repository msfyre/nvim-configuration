return {
	"nvim-tree/nvim-tree.lua",
	opts = {
		sort = {
			sorter = "case_sensitive",
		},
		view = {
			width = 40,
		},
		filters = {
			dotfiles = true,
		},
		sync_root_with_cwd = true,
	},
}
