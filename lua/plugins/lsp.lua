require('neodev').setup {}
local lspconfig = require('lspconfig')
local cmp = require('cmp')
local lspkind = require('lspkind')
local luasnip = require('luasnip')
require('luasnip.loaders.from_vscode').lazy_load()

cmp.setup {
    snippet = {
        expand = function (args)
            luasnip.lsp_expand(args.body)
        end,
    },
    window = {
    },
    mapping = cmp.mapping.preset.insert {
        ['<Tab>'] = cmp.mapping(function (fallback)
            if luasnip.jumpable(1) then
                luasnip.jump(1)
            elseif cmp.visible() then
                cmp.select_next_item()
            else
                fallback()
            end
        end, { 'i', 's' }),
        ['<S-Tab>'] = cmp.mapping(function (fallback)
            if luasnip.jumpable(-1) then
                luasnip.jump(-1)
            elseif cmp.visible() then
                cmp.select_prev_item()
            else
                fallback()
            end
        end, { 'i', 's' }),
        ['<CR>'] = cmp.mapping.confirm { select = false },
    },
    sources = cmp.config.sources({
        { name = 'nvim_lsp' },
        { name = 'luasnip' },
        { name = 'cmp_tabnine' },
        { name = 'buffer' },
        { name = 'path' },
    }),
    formatting = {
        format = lspkind.cmp_format()
    },
}

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

