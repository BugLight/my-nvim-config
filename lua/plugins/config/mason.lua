return function ()
    require('mason').setup {
        ui = {
            border = 'rounded',
        }
    }

    local lsp = require('core.lsp')

    require('mason-lspconfig').setup {
        ensure_installed = lsp.server_names,
    }
end

