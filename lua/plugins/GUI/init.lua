local loader = require("modules.Utilities.PluginLoader")

local plugins = {
    loader.LoadPlugin("plugins.GUI.Themes"),
    loader.LoadPlugin("plugins.GUI.Notifications"),
    loader.LoadPlugin("plugins.GUI.StatusLine"),
    loader.LoadPlugin("plugins.GUI.Snacks"),
    loader.LoadPlugin("plugins.GUI.Tabs"),
}

return plugins
