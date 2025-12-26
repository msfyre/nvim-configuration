return {
	"nvimdev/dashboard-nvim",
	opts = {
		theme = "doom",
		disable_move = true,
		shortcut_type = "number",
		hide = {
			tabline = true,
			winbar = true,
		},
		config = {
			center = {
				{
					icon = "⚙️",
					desc = "Configuration",
					action = function()
						local username = os.getenv("USER") or os.getenv("USERNAME") or "UNKNOWN"

						vim.cmd("cd C:\\Users\\" .. username .. "\\AppData\\Local\\nvim")
						vim.cmd("Telescope find_files")
					end,
				},
			},
		},
	},
}
