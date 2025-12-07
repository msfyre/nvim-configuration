local hotkeys = {
	leader = " ",
	mappings = {
		normal = {
			{
				"<C-s>",
				":w<CR>",
				desc = "Save your progress.",
			},
			{
				"<C-S-s>",
				":wa<CR>",
				desc = "Save all open buffers.",
			}
		}
	}
}

return hotkeys