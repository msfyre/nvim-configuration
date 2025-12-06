local LSP = {}

function LSP.Initialize()
	local mason = require("mason");
	local mason_lspconfig = require("mason-lspconfig");

	local lspconfig = require("lspconfig");

	mason.setup();
    mason_lspconfig.setup();

	local capabilities = require("cmp_nvim_lsp").default_capabilities();

	mason_lspconfig.setup_handlers({
		function(server)
			lspconfig[server].setup({
				capabilities = capabilities,
			})
		end,
	})

	print("[Language Server Protocol]: Ready!");
end

return LSP
