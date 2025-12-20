return {
	--#region Mason
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
			"neovim/nvim-lspconfig",
		},
		config = function()
			require("mason-lspconfig").setup()
		end,
	},
	--#endregion
	--#region Linting & Formatting
	{
		"mfussenegger/nvim-lint",
		event = { "BufEnter", "BufWritePost" },
		config = function()
			local lint = require("lint")

			lint.linters_by_ft = {
				javascript = { "eslint" },
				typescript = { "eslint" },
				typescriptreact = { "eslint" },
				markdown = { "markdownlint" },
			}

			vim.api.nvim_create_autocmd({ "BufWritePost" }, {
				callback = function()
					lint.try_lint()

					vim.notify("Lint complete.", vim.log.levels.INFO, {
						title = "Linter",
					})
				end,
			})
		end,
	},
	{
		"stevearc/conform.nvim",
		event = { "BufWritePost" },
		config = function()
			local conform = require("conform")

			conform.setup({
				formatters_by_ft = {
					lua = { "stylua" },
					javascript = { "prettierd" },
					typescript = { "prettierd" },
					typescriptreact = { "prettierd" },
				},
				format_on_save = true,
			})
		end,
	},
	--#endregion
	--#region Autocompletion
	{
		"hrsh7th/nvim-cmp",
		dependencies = {
			"hrsh7th/cmp-nvim-lsp",
			"hrsh7th/cmp-buffer",
			"hrsh7th/cmp-path",
			"saadparwaiz1/cmp_luasnip",
			"L3MON4D3/LuaSnip", -- snippet engine
			"onsails/lspkind.nvim",
			"rafamadriz/friendly-snippets",
		},
		event = { "BufReadPost", "InsertEnter" },
		config = function()
			local cmp = require("cmp")
			local luasnip = require("luasnip")

			local lazyLoadSuccess, result = pcall(function()
				return require("luasnip.loaders.from_vscode").lazy_load()
			end)

			if lazyLoadSuccess then
				vim.notify("Loaded!", "info", {
					title = "CMP Snippets",
				})
			end

			local setupSuccess, result = pcall(function()
				local opts = {
					snippet = {
						expand = function(args)
							luasnip.lsp_expand(args.body)
						end,
					},

					window = {
						completion = cmp.config.window.bordered(),
						documentation = cmp.config.window.bordered(),
					},

					mapping = cmp.mapping.preset.insert({
						["<C-Space>"] = cmp.mapping.complete(),
						["<CR>"] = cmp.mapping.confirm({ select = true }),
						["<C-e>"] = cmp.mapping.abort(),

						["<Tab>"] = cmp.mapping(function(fallback)
							if cmp.visible() then
								cmp.select_next_item()
							elseif luasnip.expand_or_jumpable() then
								luasnip.expand_or_jump()
							else
								fallback()
							end
						end, { "i", "s" }),

						["<S-Tab>"] = cmp.mapping(function(fallback)
							if cmp.visible() then
								cmp.select_prev_item()
							elseif luasnip.jumpable(-1) then
								luasnip.jump(-1)
							else
								fallback()
							end
						end, { "i", "s" }),
					}),

					sources = cmp.config.sources({
						{ name = "nvim_lsp" },
						{ name = "luasnip" },
						{ name = "path" },
						{ name = "buffer" },
					}),
				}

				return cmp.setup(opts)
			end)

			if setupSuccess then
				vim.notify("Success!", "info", {
					title = "CMP",
				})
			else
				vim.notify("Error: " .. result, "warn", {
					title = "(CMP) Something went wrong!",
				})
			end

			vim.lsp.config("lua_ls", {
				settings = {
					Lua = {
						diagnostics = {
							globals = { "vim" },
						},
					},
				},
			})
		end,
	},
	{
		"hrsh7th/cmp-cmdline",
		dependencies = {
			"hrsh7th/nvim-cmp",
		},
		config = function()
			local cmp = require("cmp")

			local setupSuccess, result = pcall(function()
				return cmp.setup.cmdline(":", {
					mapping = cmp.mapping.preset.cmdline(),
					sources = cmp.config.sources({
						{ name = "path" }, -- For file path completion
					}, {
						{ name = "cmdline" }, -- For Neovim command completion
					}),
				})
			end)

			if setupSuccess then
				vim.notify("Ready!", "info", {
					title = "Command Autocomplete",
				})
			else
				vim.notify("Error: " .. result, "warn", {
					title = "(CMD Autocomplete) Something went wrong!",
				})
			end
		end,
	},
	--#endregion
}
