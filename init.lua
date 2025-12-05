--!strict

vimConfigPath = vim.fn.stdpath("config");
package.path = vimConfigPath .. "/?.lua;" .. vimConfigPath .. "/?/.init.lua;" .. package.path;

configPath = vimConfigPath .. "/configurations"

-- Global modules
neovide = require("localmodules.neovide");

events = require("localmodules.events");

pluginsModule = require("localmodules.plugins");
windowModule = require("localmodules.window");

LSPModule = require("localmodules.LSP");

neotreeModule = require("localmodules.neotree");

-- Configs
neotreeConfig = require("configurations.neotreeConfig");

require("run").Run();
