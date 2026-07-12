return {
    'saghen/blink.cmp',
    version = '*',
    opts = {
        keymap = {
            preset = 'enter',

            ['<Tab>'] = { 'select_next', 'fallback' },
            ['<S-Tab>'] = { 'select_prev', 'fallback' },
        },
        appearance = {
            nerd_font_variant = 'mono',
            use_nvim_cmp_as_default = true,
        },
        completion = {
            menu = {
                scrollbar = false,
                border = 'single',
                winhighlight = 'Normal:Normal,FloatBorder:FloatBorder,CursorLine:BlinkCmpMenuSelection,Search:None',
            },
            documentation = {
                window = {
                    scrollbar = false,
                    border = 'single',
                    winhighlight = 'Normal:Normal,FloatBorder:FloatBorder',
                },
            },
        },
        sources = {
            default = { 'lazydev', 'lsp', 'path', 'snippets', 'buffer' },
            providers = {
                lazydev = {
                    name = "LazyDev",
                    module = "lazydev.integrations.blink",
                    -- make lazydev completions top priority (see `:h blink.cmp`)
                    score_offset = 100,
                },
            },
        },
    },
    opts_extend = { "sources.default" },
    config = function(_, opts)
        local blink = require('blink.cmp')
        blink.setup(opts)
        vim.lsp.config('*', {
            capabilities = blink.get_lsp_capabilities()
        })
    end,
}
