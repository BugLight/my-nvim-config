return function ()
    require('neodev').setup {}

    local lspconfig = require('lspconfig')
    local lsp = require('lsp')
    local capabilities = require('cmp_nvim_lsp').default_capabilities()

    for _, server in ipairs(lsp.server_settings) do
        local settings = {}
        local name
        if type(server) == 'table' then
            settings = server[2]
            name = server[1]
        else
            name = server
        end
        lspconfig[name].setup {
            settings=settings,
            capabilities = capabilities,
        }
    end
end

