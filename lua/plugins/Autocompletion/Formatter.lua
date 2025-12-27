return {
	"stevearc/conform.nvim",
	opts = {
		formatters_by_ft = {
			json = { "prettier", "prettierd" },
			lua = { "stylua" },
			luau = { "stylua" },
			typescript = { "prettier", "prettierd" },
		},
	},
}
