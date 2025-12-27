local commands_config = require("lua.config.Commands")

for cmdname, cmd in pairs(commands_config) do
	vim.api.nvim_create_user_command(cmd.command, cmd.action, {})	
end
