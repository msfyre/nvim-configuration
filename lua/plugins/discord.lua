return {
	"vyfor/cord.nvim",
	build = ":Cord update",
	config = function()
		require("cord").setup({
			text = {
				lsp = "Modifying LSPs in ${lspmanager}...",
				docs = '"Hol\' on... let me read the docs..."'
			},
			variables = {
				lspmanager = "Mason"
			}
		})
	end
}
