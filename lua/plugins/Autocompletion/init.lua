local loader = require("modules.Utilities.PluginLoader")

local plugins = {
    loader.LoadPlugin("plugins.Autocompletion.Mason"),
    loader.LoadPlugin("plugins.Autocompletion.LSPs"),
    loader.LoadPlugin("plugins.Autocompletion.Diagnostics"),
    loader.LoadPlugin("plugins.Autocompletion.Snippets"),
    loader.LoadPlugin("plugins.Autocompletion.Linter"),
    loader.LoadPlugin("plugins.Autocompletion.Formatter"),
}

return plugins
