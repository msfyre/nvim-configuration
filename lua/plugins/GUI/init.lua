local loader = require("modules.Utilities.PluginLoader")

return {
	-- Themes
	loader.LoadPlugin("plugins.GUI.Themes"),

	-- File Explorer
	loader.LoadPlugin("plugins.GUI.Snacks"),

	-- Individual components
	loader.LoadPlugin("plugins.GUI.Notifications"), -- Notifications
	loader.LoadPlugin("plugins.GUI.Status Line"), -- Status Line
	loader.LoadPlugin("plugins.GUI.Tabs"), -- Tabs

	loader.LoadPlugin("plugins.GUI.Focus"), -- Autofocus
}
