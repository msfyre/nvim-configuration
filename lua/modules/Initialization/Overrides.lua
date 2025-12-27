-- Reset all
vim.cmd("set all&")

local overrides = require("lua.config.overrides")
local oil_installed, oil = pcall(function()
	return require("oil")
end)

if overrides.disable_netrw and oil_installed then
	vim.g.loaded_netrw = 1
	vim.g.loaded_netrwPlugin = 1

	vim.notify("NetRW disabled.", "info", {
		title = "Overrides",
	})
end
