return {
	{
		"mfussenegger/nvim-lint",
		config = function()
			require("lint").linters_by_ft = {
				json = { "jsonlint" },
				lua = {"selene"},
				typescript = {"eslint", "eslint_d"},
			}
		end
	},
	{
		"stevearc/conform.nvim",
		opts = {
			formatters_by_ft = {
				json = { "prettier", "prettierd" },
				lua = { "stylua" },
				luau = { "stylua" },
				typescript = { "prettier", "prettierd" },
			}
		}
	},
}
