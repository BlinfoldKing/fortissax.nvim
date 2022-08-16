require("mason-lspconfig").setup()

local custom_attach = function(client, bufnr)

end

require("mason-lspconfig").setup_handlers {
    function (server_name)
        local capabilities = require('cmp_nvim_lsp').update_capabilities(vim.lsp.protocol.make_client_capabilities())
        local opts = {
            on_attach = custom_attach,
            capabilities = capabilities
        }

        -- capabilities.offsetEncoding = "utf-8"
        require("lspconfig")[server_name].setup(opts)
    end,
}

