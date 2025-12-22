return {
	--#region Autocompletion
	{
		"hrsh7th/nvim-cmp",
		dependencies = {
			-- Mason
			"mason-org/mason.nvim",
			"mason-org/mason-lspconfig.nvim",

			-- Essential
			"hrsh7th/cmp-nvim-lsp",
			"hrsh7th/cmp-buffer",
			"FelipeLema/cmp-async-path", -- cmp-path freezes nvim if project is big so it's async_path instead
			"hrsh7th/cmp-cmdline",

			-- Linting & Formatting
			"mfussenegger/nvim-lint",
			"stevearc/conform.nvim",

			-- Snippets
			"dcampos/nvim-snippy",
			"dcampos/cmp-snippy",

			-- Icons
			"hrsh7th/cmp-emoji",
		},
		config = function()
			local cmp = require("cmp")

			local snipsuccess, snippy = pcall(function()
				return require("snippy")
			end)

			local lspsuccess, lspresult = pcall(function()
				require("mason").setup()
				require("mason-lspconfig").setup({
					ensure_installed = {
						-- Typescript
						"denols",
						"ts_ls",
						-- Lua
						"lua_ls",
					},
					automatic_installation = true,
				})
			end)

			local l_fsuccess, lfresult = pcall(function()
				local conform = require("conform")
				local lint = require("lint")

				-- Linter config
				lint.linters_by_ft = {
					typescript = { "denols", "eslint" },
				}

				-- Formatter config
				conform.setup({
					formatters_by_ft = {
						lua = { "stylua" },
						typescript = { "prettier", "prettierd" },
					},
				})
			end)

			local cmpsuccess, cmpresult = pcall(function()
				local function has_words_before()
					unpack = unpack or table.unpack
					local line, col = unpack(vim.api.nvim_win_get_cursor(0))
					return col ~= 0
						and vim.api.nvim_buf_get_lines(0, line - 1, line, true)[1]:sub(col, col):match("%s") == nil
				end

				cmp.setup({
					snippet = {
						expand = function(args)
							require("snippy").expand_snippet(args.body)
						end,
					},
					window = {
						completion = cmp.config.window.bordered(),
						documentation = cmp.config.window.bordered(),
					},
					mapping = cmp.mapping.preset.insert({
						["<CR>"] = cmp.mapping.confirm({ select = true }),
						["<Tab>"] = cmp.mapping(function(fallback)
							if cmp.visible() then
								cmp.select_next_item()
							elseif snippy.can_expand_or_advance() then
								snippy.expand_or_advance()
							elseif has_words_before() then
								cmp.complete()
							else
								fallback()
							end
						end, { "i", "s" }),
						["<S-Tab>"] = cmp.mapping(function(fallback)
							if cmp.visible() then
								cmp.select_prev_item()
							elseif snippy.can_jump(-1) then
								snippy.previous()
							else
								fallback()
							end
						end, { "i", "s" }),
					}),
					completion = {
						autocomplete = { cmp.TriggerEvent.TextChanged, cmp.TriggerEvent.InsertEnter },
						completeopt = "menu,menuone",
					},
					sources = cmp.config.sources({
						{ name = "nvim_lsp" },
						{ name = "snippy" },
						{ name = "buffer" },
						{ name = "async_path" },
						{ name = "cmdline" },
						{ name = "emoji" },
					}),
				})
				cmp.setup.cmdline(":", {
					mapping = cmp.mapping.preset.cmdline(),
					sources = cmp.config.sources({ { name = "path" } }, { { name = "cmdline" } }),
				})
			end)

			if cmpsuccess then
				vim.notify("Success!", "info", {
					title = "nvim-cmp Setup",
				})
			else
				vim.notify(cmpresult, "error", {
					title = "nvim-cmp Setup Error!",
				})
			end
		end,
	},
	--#endregion
}
