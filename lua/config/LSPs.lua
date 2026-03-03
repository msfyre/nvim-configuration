return {
	luau_lsp = {
		platform = {
			type = "roblox",
		},
		sourcemap = {
			enabled = true,
			autogenerate = true,
			rojoProjectFile = "default.project.json",
			sourcemap_file = "sourcemap.json",
		},
	},
	arduino_language_server = {
		cmd = {
			"arduino-language-server",
			"-cli-config",
			os.getenv("HOME") .. "/.arduino15/arduino-cli.yaml",
			"-fqbn",
			"arduino:avr:uno",
		},
	},
}
