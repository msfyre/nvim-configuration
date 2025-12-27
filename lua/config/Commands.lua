return {
	Lint = {
		command = "Lint",
		action = function ()
			require("modules.Editor.Lint").Lint()
		end
	},
}
