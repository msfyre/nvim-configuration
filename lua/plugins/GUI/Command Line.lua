return {
	"VonHeikemen/fine-cmdline.nvim",
	dependencies = {
		"MunifTanjim/nui.nvim",
	},
	config = function()
		require("fine-cmdline").setup({
			cmdline = {
				prompt = "COMMAND:: ",
			},
			popup = {
				position = {
					row = "50%",
					col = "50%",
				},
			},
		})
		vim.api.nvim_set_keymap("n", ":", "<cmd>FineCmdline<CR>", { noremap = true })
	end,
}
