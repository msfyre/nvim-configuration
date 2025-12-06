local Discord = {};

function Discord.DisplayRichPresence()
	require("presence").setup({
		auto_update = true,
		neovim_image_text = "how to close nvim??? help???",
		main_image = "neovim",
	});
end

return Discord