local LSPConfigs = require("config.LSPs")

for server, config in pairs(LSPConfigs) do
	vim.lsp.config(server, config)
end
