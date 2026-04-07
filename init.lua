editor_macros = require("modules.editor_macros")
server_config_module = require("config.language")

if vim.g.neovide then
    require("config.neovide")
end

require("config.lazy")
require("config.keymaps")
require("config.autocmds")
require("config.usercmds")
require("config.theme").load_theme("tokyonight")
