return function ()
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
end

