local module = {}

function module.Apply()
	local neovideConfig = require("lua.config.neovide")

	local editorConfig = neovideConfig.editor or {}

	if editorConfig.tabsize then
		vim.opt.tabstop = editorConfig.tabsize
		vim.opt.shiftwidth = editorConfig.tabsize
	end

	if editorConfig.useSpaces ~= nil then
		vim.opt.expandtab = editorConfig.useSpaces
	end

	if editorConfig.wrapLines ~= nil then
		-- uh...
		vim.opt.wrap = editorConfig.wrapLines
	end

	if editorConfig.hideMouseWhenTyping ~= nil then
		vim.g.neovide_hide_mouse_when_typing = editorConfig.hideMouseWhenTyping
	end
end

return module
