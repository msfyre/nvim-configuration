return {
	{
		"stevearc/oil.nvim",
		dependencies = {
			"nvim-tree/nvim-web-devicons",
		},
		opts = {},
		config = function()
			require("oil").setup({
				default_file_explorer = true,
				columns = {
					"icon",
					"size",
				},
				buf_options = {
					bufhidden = "hide",
				},
				keymaps = {
					["g?"] = { "actions.show_help", mode = "n" },
					["<BS>"] = {
						function()
							local actions = require("oil.actions")

							local success, result = pcall(function()
								return actions.parent.callback()
							end)

							if success then
								vim.cmd("cd ..")
							end
						end,
						mode = "n",
					},
					["<CR>"] = {
						function()
							local oil = require("oil")
							local oil_actions = require("oil.actions")

							local entry = oil.get_cursor_entry()
							local ent_dir = oil.get_current_dir()

							local success, result = pcall(function()
								return oil_actions.select.callback()
							end)

							if success and entry then
								local path = ent_dir .. entry.name

								if entry.type == "directory" then
									vim.cmd("cd " .. path)
								else
									vim.cmd("e " .. path)
								end
							end
						end,
					},
				},
				float = {
					max_width = 0.75,
					max_height = 0.75,
				},
			})
		end,
	},
}
