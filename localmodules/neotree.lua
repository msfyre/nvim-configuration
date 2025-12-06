local Neotree = {}

function Neotree.Init()
	require("neo-tree").setup(neotreeConfig);

	print("[neotree.vim]: Setup complete!");
end

---@param path string?
function Neotree.Show(path)
	vim.cmd("Neotree");
	vim.cmd("cd C:");
end

return Neotree