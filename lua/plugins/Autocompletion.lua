return {
	-- #region Mason
	{
		"mason-org/mason.nvim",
		opts = {
			ui = {
				icons = {
					package_installed = "[/]",
					package_pending = "[...]",
					package_uninstalled = "[X]",
				},
			},
		},
	},
	{ -- Mason's LSP Config
		"mason-org/mason-lspconfig.nvim",
		dependencies = {
			"neovim/nvim-lspconfig",
		},
		opts = {
			automatic_enable = true,
			ensure_installed = {
				"lua_ls",
				"vimls",
			},
		},
	},
	-- #endregion
	-- #region Language Servers
	{
		"hrsh7th/nvim-cmp",
		dependencies = {
			"hrsh7th/cmp-nvim-lsp",
			"hrsh7th/cmp-buffer",
			"hrsh7th/cmp-path",
			"FelipeLema/cmp-async-path",

			-- Snippet Engine
			{
				"L3MON4D3/LuaSnip",
				dependencies = {
					"saadparwaiz1/cmp_luasnip",
				},
			},

			"rafamadriz/friendly-snippets", -- Snippets
		},
		events = "BufReadPost",
		config = function()
			local cmp = require("cmp")
			local luasnip = require("luasnip")

			-- In a separate file like lua/snippets.lua and then require it in init.lua
			require("luasnip.loaders.from_vscode").lazy_load()

			cmp.setup({
				snippet = {
					expand = function(args)
						luasnip.lsp_expand(args.body)
					end,
				},
				sources = cmp.config.sources({
					{ name = "nvim_lsp" },
					{ name = "luasnip" },
					{ name = "buffer" },
				}),
				mapping = cmp.mapping.preset.insert({
					["<C-b>"] = cmp.mapping.scroll_docs(-4),
					["<C-f>"] = cmp.mapping.scroll_docs(4),
					["<C-Space>"] = cmp.mapping.complete(),
					["<C-e>"] = cmp.mapping.abort(),
					["<CR>"] = cmp.mapping(function(fallback)
						if cmp.visible() then
							if luasnip.expandable() then
								luasnip.expand()
							else
								cmp.confirm({
									select = true,
								})
							end
						else
							fallback()
						end
					end),
					["<Tab>"] = cmp.mapping(function(fallback)
						if cmp.visible() then
							cmp.select_next_item()
						elseif luasnip.locally_jumpable(1) then
							luasnip.jump(1)
						else
							fallback()
						end
					end, { "i", "s" }),
					["<S-Tab>"] = cmp.mapping(function(fallback)
						if cmp.visible() then
							cmp.select_prev_item()
						elseif luasnip.locally_jumpable(-1) then
							luasnip.jump(-1)
						else
							fallback()
						end
					end, { "i", "s" }),
				}),
			})
		end,
	},
	-- #endregion
	-- #region Linter & Formatter
	{ -- Linter
		"mfussenegger/nvim-lint",
		events = { "BufWritePre", "BufWrite", "BufWritePost" },
		config = function()
			local lint = require("lint")

			lint.linters.ast_grep = {
				cmd = vim.fn.stdpath("data") .. "/mason/bin/sg.exe",
				stdin = false,
				args = { "scan" },
				stream = "stdout",
				ignore_exitcode = true,

				parser = require("lint.parser").from_errorformat("%f:%l:%c: %m", { source = "ast-grep" }),
			}

			lint.linters_by_ft = {
				json = { "jsonlint" },
				lua = { "selene" },
				rust = { "ast_grep" },
				typescript = { "eslint", "eslint_d" },
			}
		end,
	},
	{ -- Formatter
		"stevearc/conform.nvim",
		events = { "BufWritePre", "BufWrite", "BufWritePost" },
		opts = {
			formatters_by_ft = {
				json = { "prettier", "prettierd" },
				lua = { "stylua" },
				luau = { "stylua" },
				rust = { "ast-grep" },
				typescript = { "prettier", "prettierd" },
			},
			format_on_save = {
				timeout_ms = 5000,
				lsp_fallback = true,
			},
		},
	},
	-- #endregion
	-- #region Command Line Autocompletion
	{
		"hrsh7th/cmp-cmdline",
		events = { "CmdlineEnter" },
		config = function()
			local cmp = require("cmp")

			cmp.setup.cmdline(":", {
				mapping = cmp.mapping.preset.cmdline(),
				sources = cmp.config.sources({ { name = "path" } }, { { name = "cmdline" } }),
				matching = { disallow_symbol_nonprefix_matching = false },
			})
		end,
	},
	-- #endregion
	-- #region Diagnostics
	{
		"rachartier/tiny-inline-diagnostic.nvim",
		event = "TextChanged",
		priority = 1000,
		config = function()
			require("tiny-inline-diagnostic").setup({
				options = {
					multilines = {
						enabled = true,
					},
				},
			})
			vim.diagnostic.config({ virtual_text = false }) -- Disable Neovim's default virtual text diagnostics
		end,
	},
	-- #endregion
}
