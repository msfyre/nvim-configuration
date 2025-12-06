local Neovide = {}

function Neovide.Initialize()
	if (not vim.g.neovide) then return end

	vim.g.neovide_fullscreen = neovideConfig.interface.fullscreen;

	vim.o.guifont = neovideConfig.font.fontFace .. ":h" .. neovideConfig.font.fontSize;
end

return Neovide