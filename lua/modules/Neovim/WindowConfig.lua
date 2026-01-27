local nvimConfig = require("config.Neovim") or nil

if nvimConfig == nil then
	return
end

-- Theme
if nvimConfig.window.theme ~= nil then
	vim.cmd("colorscheme " .. nvimConfig.window.theme)
end
