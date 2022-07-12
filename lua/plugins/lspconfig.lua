local capabilities = vim.lsp.protocol.make_client_capabilities()

local lspconfig = require('lspconfig')

-- CMake
lspconfig.cmake.setup {
    capabilities = capabilities,
    init_options = {
        buildDirectory = 'build'
    }
}

-- Python
lspconfig.pyright.setup {
    capabilities = capabilities,
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

-- Latex
lspconfig.texlab.setup {
    capabilities = capabilities
}

