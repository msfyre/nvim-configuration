--!strict

local stringMacro = require("luaumacros.stringMacro");

local PluginModule = {};

local function InstallPlug()
	print("Installing vim-plug...");

	vim.fn.system(
		{
			"powershell",
			"-NoProfile",
			"-Command",
			"iwr -useb https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim | " .. "ni '" .. vimPlugPath .. "' -Force"
		}
	);

	vim.cmd("restart");
end

function PluginModule.Initialize()
	local pluginsFilePath = configPath .. "/.plugins";
	local pluginsFile = io.open(pluginsFilePath, "r");

	if vim.fn.filereadable(vimPlugPath) == 0 then
		print("Vim-Plug is not installed!");

		InstallPlug();
	end

	if (pluginsFile ~= nil) then 
		local pluginsList = pluginsFile:read("*a");

		vim.cmd('call plug#begin(stdpath("data") . "/plugged")');

		local pluginsArray = stringMacro.split(pluginsList, ";");
		local concatenatedArray = stringMacro.concat(pluginsArray, "");
		local pluginsArrayNoLineBreak = stringMacro.split(concatenatedArray, "\n");

		for i, plugin in ipairs(pluginsArrayNoLineBreak) do

            local characters = stringMacro.split(plugin, "");

			print(characters[#characters]);

            if (plugin == "") or (characters[1] == "[" or characters[#characters] == "]") then 
				goto continue
			end 

			print("Reading plugin: " .. plugin);

			local pluginString =  string.format("'%s'", plugin)

			print(pluginString);

			local command = "Plug " .. pluginString;

			vim.cmd(command);

			::continue::

		end

		vim.cmd('call plug#end()');
		vim.cmd("PlugClean");
		vim.cmd('PlugInstall');
		vim.cmd('tabc');

		pluginsFile:close();
	else
		vim.cmd("qa");
	end;
end

return PluginModule
