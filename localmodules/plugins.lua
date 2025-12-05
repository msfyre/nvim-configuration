--!strict

local stringMacro = require("luaumacros.string");

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

	print("Installed!");
end

function PluginModule.Initialize()
	local vimPlugPath = vim.fn.stdpath("data") .. "/site/autoload/plug.vim";
	
	local pluginsFilePath = configPath .. "/.plugins";
	local pluginsFile = io.open(pluginsFilePath, "r");

	if (vim.fn.empty(vim.fn.glob(vimPlugPath)) > 0) then
		InstallPlug();
	end

	if (pluginsFile ~= nil) then 
		local pluginsList = pluginsFile:read("*a");

		vim.cmd('call plug#begin(stdpath("data") . "/plugged")');

		local pluginsArray = stringMacro.split(pluginsList, ";");
		local concatenatedArray = stringMacro.concat(pluginsArray, "");
		local pluginsArrayNoLineBreak = stringMacro.split(concatenatedArray, "\n");

		for i, plugin in ipairs(pluginsArrayNoLineBreak) do
			if (plugin == "") then 
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
		vim.cmd('PlugInstall');
		vim.cmd('tabc');

		pluginsFile:close();
	else
		vim.cmd("qa");
	end;
end

return PluginModule