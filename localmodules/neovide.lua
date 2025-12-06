local Neovide = {}

function Neovide.Initialize()
	if (not vim.g.neovide) then return end

	vim.g.neovide_fullscreen = neovimConfig.interface.fullscreen;

	vim.o.guifont = neovimConfig.font.fontFace .. ":h" .. neovimConfig.font.fontSize;
end

return Neovide