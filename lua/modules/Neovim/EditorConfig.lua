local nvimConfig = require("config.Neovim") or nil

if nvimConfig == nil then
	return
end

-- Indents
if nvimConfig.editor.useSpaces ~= nil then
	vim.opt.expandtab = not nvimConfig.editor.useSpaces
end

if nvimConfig.editor.tabsize ~= nil then
	vim.opt.tabstop = nvimConfig.editor.tabsize
	vim.opt.shiftwidth = nvimConfig.editor.tabsize
end
-- Wrap
if nvimConfig.editor.wrapLines ~= nil then
	vim.opt.wrap = nvimConfig.editor.wrapLines
end
