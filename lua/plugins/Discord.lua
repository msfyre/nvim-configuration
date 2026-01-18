return {
	"vyfor/cord.nvim",
	build = ":Cord update",
	events = "VimEnter",
	config = function()
		require("cord").setup({
			text = {
				lsp = "Modifying LSPs in ${lspmanager}...",
				docs = '"Hol\' on... let me read the docs..."',
			},
			variables = {
				lspmanager = "Mason",
			},
		})
	end,
}
