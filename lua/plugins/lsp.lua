vim.g.coq_settings = {
    auto_start = 'shut-up',
    ['display.pum.fast_close'] = false,
}

require('nvim-lsp-installer').setup { automatic_installation = true }

local lspconfig = require('lspconfig')
local coq = require('coq')

local servers = {
    {
        'cmake',
        {
            init_options = {
                buildDirectory = 'build'
            }
        }
    },
    {
        'pyright',
        {
            settings = {
                python = {
                    venvPath = '.',
                    analysis = {
                        diagnosticMode = 'workspace',
                        useLibraryCodeForTypes = true
                    }
                }
            }
        }
    },
    'texlab',
    'eslint',
    'html',
    'vuels',
}

for _, server in ipairs(servers) do
    if type(server) == 'table' then
        settings = server[2]
        server = server[1]
    else
        settings = {}
    end
    lspconfig[server].setup(coq.lsp_ensure_capabilities(settings))
end

