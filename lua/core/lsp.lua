local M = {}

M.server_settings = {
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
    'rust_analyzer',
    'lua_ls',
    'clangd',
}

M.server_names = {}

for _, server in ipairs(M.server_settings) do
    if type(server) == 'table' then
        server = server[1]
    end
    table.insert(M.server_names, server)
end

return M

