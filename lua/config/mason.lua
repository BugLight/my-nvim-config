return function ()
    require('mason').setup {
        ui = {
            border = 'single',
        }
    }

    local lsp = require('lsp')

    require('mason-lspconfig').setup {
        ensure_installed = lsp.server_names,
    }
end

