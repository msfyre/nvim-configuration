return {
	"mfussenegger/nvim-lint",
	config = function()
		require("lint").linters_by_ft = {
			json = { "jsonlint" },
			lua = { "selene" },
			typescript = { "eslint", "eslint_d" },
		}
	end,
}
