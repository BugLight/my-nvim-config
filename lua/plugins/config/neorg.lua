return function()
    require('neorg').setup {
        load = {
            ['core.defaults'] = {},
            ['core.completion'] = {
                config = {
                    engine = 'nvim-cmp',
                },
            },
            ['core.concealer'] = {},
            ['core.dirman'] = {
                config = {
                    workspaces = {
                        notes = '~/notes',
                    },
                    default_workspace = 'notes',
                },
            },
        }
    }
end
