local lsp_installer = require("nvim-lsp-installer")

local custom_attach = function(client, bufnr) end

lsp_installer.on_server_ready(function(server)
	local capabilities = require("cmp_nvim_lsp").update_capabilities(vim.lsp.protocol.make_client_capabilities())
	local opts = {
		capabilities = capabilities,
		on_attach = custom_attach,
	}

	server:setup(capabilities)
end)

local signs = { Error = " ", Warn = " ", Hint = " ", Info = " " }
for type, icon in pairs(signs) do
	local hl = "DiagnosticSign" .. type
	vim.fn.sign_define(hl, { text = icon, texthl = hl, numhl = hl })
end
