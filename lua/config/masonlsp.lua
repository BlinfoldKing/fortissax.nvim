local coq = require("coq")

require("mason-lspconfig").setup()
require("mason-lspconfig").setup_handlers {
    function (server_name)
        local opts = {
        }
        require("lspconfig")[server_name].setup(coq.lsp_ensure_capabilities(opts))
    end,
}

local signs = { Error = " ", Warn = " ", Hint = " ", Info = " " }
for type, icon in pairs(signs) do
  local hl = "DiagnosticSign" .. type
  vim.fn.sign_define(hl, { text = icon, texthl = hl, numhl = hl })
end
