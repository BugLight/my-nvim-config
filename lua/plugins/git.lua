return {
    {
        'lewis6991/gitsigns.nvim',
        opts = {},
        event = 'BufRead',
        keys = {
            {
                '<leader>gb',
                function()
                    require('gitsigns').blame()
                end,
                desc = 'Git blame',
            },
        },
    },
}
