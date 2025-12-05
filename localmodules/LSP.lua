local LSP = {}

function LSP.Initialize()
	require("mason").setup()

	print("[mason-vim]: Setup complete!")
end

return LSP