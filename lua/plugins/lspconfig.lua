return {
    'williamboman/mason-lspconfig.nvim',
    dependencies = {
        'williamboman/mason.nvim',
        'neovim/nvim-lspconfig',
    },
    config = function()
        local lspconfig = require('lspconfig')
        local capabilities = require('blink.cmp').get_lsp_capabilities()

        require('mason').setup {
            ui = {
                border = 'single',
            }
        }
        require('mason-lspconfig').setup {
            ensure_installed = {
                'clangd',
                'lua_ls',
                'pyright',
                'rust_analyzer',
            },
        }

        require('mason-lspconfig').setup_handlers {
            function(server_name)
                lspconfig[server_name].setup {
                    capabilities = capabilities
                }
            end,
            ['cmake'] = function()
                lspconfig.cmake.setup {
                    capabilities = capabilities,
                    settings = {
                        init_options = {
                            buildDirectory = 'build'
                        }
                    },
                }
            end,
            ['pyright'] = function()
                lspconfig.pyright.setup {
                    capabilities = capabilities,
                    settings = {
                        settings = {
                            python = {
                                venvPath = '.',
                                analysis = {
                                    diagnosticMode = 'workspace',
                                    useLibraryCodeForTypes = true
                                }
                            }
                        }
                    },
                }
            end,
        }
    end,
}
