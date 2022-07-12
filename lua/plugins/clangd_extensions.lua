local capabilities = vim.lsp.protocol.make_client_capabilities()

require('clangd_extensions').setup {
    server = {
        capabilities = capabilities
    }
}

