return {
	{
		"nvim-neo-tree/neo-tree.nvim",
		branch = "v3.x",
		dependencies = {
		"nvim-lua/plenary.nvim",
		"MunifTanjim/nui.nvim",
		"nvim-tree/nvim-web-devicons", -- optional, but recommended
		},
		lazy = false, -- neo-tree will lazily load itself
		opts = {
			filesystem = {
				window = {
					filtered_items = {
						visible = true,
						hide_gitignored = true,
					},
					mappings = {
						["<F5>"] = "refresh",
						["o"] = "open",
					}
				}
			}
		}
	}
}
