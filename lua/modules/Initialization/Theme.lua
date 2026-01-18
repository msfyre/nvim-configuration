local neovide_config = require("lua.config.Neovide")

vim.o.termguicolors = true

local applySuccess, result = pcall(function()
	if neovide_config.window.theme == "cyberdream" then
		require("cyberdream").setup({
			highlights = {
				Normal = { fg = "#ffffff", bg = "#16181a" },
				["@text"] = { fg = "#ffffff" }, -- force plain text white
				Identifier = { fg = "#ffffff" }, -- optional, for code
				Statement = { fg = "#ffffff" }, -- optional
			},
		})
	end

	return vim.cmd.colorscheme(neovide_config.window.theme)
end)

if not applySuccess and (neovide_config.window.theme ~= "" or neovide_config.window.theme == nil) then
	vim.notify(result, "error", {
		title = "Theme failed to apply!",
	})
end
