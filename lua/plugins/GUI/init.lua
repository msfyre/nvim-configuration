local loader = require("modules.Utilities.PluginLoader")

return {
    loader.LoadPlugin("plugins.GUI.Themes"),
    loader.LoadPlugin("plugins.GUI.Notifications"),
    loader.LoadPlugin("plugins.GUI.Status Line"),
    loader.LoadPlugin("plugins.GUI.Snacks"),
    loader.LoadPlugin("plugins.GUI.Tabs"),
}
