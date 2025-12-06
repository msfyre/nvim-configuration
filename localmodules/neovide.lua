local Neovide = {}

function Neovide.Initialize()
	if (not vim.g.neovide) then return end

	vim.g.neovide_fullscreen = true;

	vim.o.guifont = "BigBlueTermPlus Nerd Font Mono:h9"
end

return Neovide