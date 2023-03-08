vim.g.coq_settings = {
    auto_start = 'shut-up',
    ['display.pum.fast_close'] = false,
    clients = {
        ['lsp.weight_adjust'] = 2,
        ['tabnine.enabled'] = true,
    },
}

local lspconfig = require('lspconfig')
local coq = require('coq')

local lsp = require('lsp')

for _, server in ipairs(lsp.server_settings) do
    if type(server) == 'table' then
        settings = server[2]
        server = server[1]
    else
        settings = {}
    end
    lspconfig[server].setup(coq.lsp_ensure_capabilities(settings))
end

