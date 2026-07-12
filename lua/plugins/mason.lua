local configured_servers = {}

for _, config in ipairs(vim.lsp.get_configs()) do
    table.insert(configured_servers, config.name)
end

return {
    'williamboman/mason-lspconfig.nvim',
    dependencies = {
        'neovim/nvim-lspconfig',
        {
            'williamboman/mason.nvim',
            opts = {
                ui = {
                    border = 'single',
                },
            },
        },
    },
    opts = {
        ensure_installed = configured_servers,
    },
}
