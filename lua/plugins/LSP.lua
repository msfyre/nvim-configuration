return {
	-- Mason
	{
		"mason-org/mason.nvim",
		config = function()
			require("mason").setup()
		end,
	},
	{
		"mason-org/mason-lspconfig.nvim",
		dependencies = {
			"mason-org/mason.nvim",
			"neovim/nvim-lspconfig" 
		},
		config = function()
			require("mason-lspconfig").setup();
		end,
	},
	-- Linting & Formatting
	{
		"mfussenegger/nvim-lint",
		event = { "BufReadPre", "BufNewFile" },
		config = function()
			local lint = require("lint")

			lint.linters_by_ft = {
				javascript = {'eslint'},
				typescript = {'eslint'},
				typescriptreact = {'eslint'},
				markdown = {'markdownlint'},
			}

			vim.api.nvim_create_autocmd({"BufWritePre"}, {
				callback = function()
					lint.try_lint()
				end,
			})
		end,
	},
	{
		"stevearc/conform.nvim",
		event = { "BufWritePre" },
		config = function()
			local conform = require("conform")

			conform.setup({
				formatters_by_ft = {
					javascript = { "prettierd" },
					typescript = { "prettierd" },
					typescriptreact = { "prettierd" },
					markdown = { "prettierd" },
				},
				format_on_save = true,
			})
		end,
	},
	-- Autocompletion
	{
		"hrsh7th/nvim-cmp",
		dependencies = {
			"hrsh7th/cmp-nvim-lsp",
			"hrsh7th/cmp-buffer",
			"hrsh7th/cmp-path",
			"saadparwaiz1/cmp_luasnip",
			"L3MON4D3/LuaSnip", -- snippet engine
			"onsails/lspkind.nvim",
			"rafamadriz/friendly-snippets"
		},
		config = function()
			local cmp = require("cmp");

			local luasnip = require("luasnip");

			local lspkind = require("lspkind");

			require("luasnip.loaders.from_vscode").lazy_load();
		end
	},
}
