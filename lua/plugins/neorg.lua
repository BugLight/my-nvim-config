return {
    'nvim-neorg/neorg',
    lazy = false,
    version = '*',
    opts = {
        load = {
            ['core.defaults'] = {},
            ['core.concealer'] = {},
            ['core.dirman'] = {
                config = {
                    workspaces = {
                        notes = '~/notes',
                    },
                    default_workspace = 'notes',
                },
            },
        },
    },
}
