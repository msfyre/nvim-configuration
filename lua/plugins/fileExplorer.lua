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
		config = function ()
			require("neo-tree").setup({
				filesystem = {
					window = {
						filtered_items = {
							visible = true,
							hide_dotfiles = false,
							hide_ignored = true,
							hide_hidden = false,
						},
						mappings = {
							["<F5>"] = "refresh",
							["o"] = "open",
						}
					}
				}
			})

		    -- For Lua configuration (init.lua)
    		vim.g.loaded_netrw = 1
		    vim.g.loaded_netrwPlugin = 1
		end
	}
}
