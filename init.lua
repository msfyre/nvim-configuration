--!strict

vimConfigPath = vim.fn.stdpath("config");
vimPlugPath = vim.fn.stdpath("data") .. "/site/autoload/plug.vim";

package.path = vimConfigPath .. "/?.lua;" .. vimConfigPath .. "/?/.init.lua;" .. package.path;

configPath = vimConfigPath .. "/configurations"

-- Global modules
neovide = require("localmodules.neovide");

events = require("localmodules.events");

pluginsModule = require("localmodules.plugins");
windowModule = require("localmodules.window");

LSPModule = require("localmodules.LSP");

neotreeModule = require("localmodules.neotree");

discordModule = require "localmodules.discord"

-- Configs
neotreeConfig = require("configurations.neotreeConfig");
neovimConfig = require("configurations.neovimConfig");
cava_config = configPath .. "/cava-config.txt";
commands = require("configurations.commands");

require("run").Run();
