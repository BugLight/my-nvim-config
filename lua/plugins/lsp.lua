local lspconfig = require('lspconfig')
local cmp = require('cmp')

cmp.setup {
    snippet = {
        expand = function (args)
            require('luasnip').lsp_expand(args.body)
        end,
    },
    window = {
    },
    mapping = cmp.mapping.preset.insert {
        ['<Tab>'] = cmp.mapping.select_next_item {},
        ['<CR>'] = cmp.mapping.confirm { select = true },
    },
    sources = cmp.config.sources({
        { name = 'nvim_lsp' },
        { name = 'luasnip' },
    }, {
        { name = 'buffer' },
    }),
}

local lsp = require('lsp')
local capabilities = require('cmp_nvim_lsp').default_capabilities()

for _, server in ipairs(lsp.server_settings) do
    if type(server) == 'table' then
        settings = server[2]
        server = server[1]
    else
        settings = {}
    end
    lspconfig[server].setup {
        settings=settings,
        capabilities = capabilities,
    }
end

