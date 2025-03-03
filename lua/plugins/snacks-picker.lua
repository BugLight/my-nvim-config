return {
    'folke/snacks.nvim',
    opts = {
        explorer = {
            enabled = true,
            replace_netrw = true,
        },
        picker = {
            enabled = true,
            sources = {
                explorer = {
                    follow_file = true,
                    jump = { close = true },
                },
            },
            layout = {
                layout = {
                    box = 'horizontal',
                    width = 0.9,
                    min_width = 120,
                    height = 0.9,
                    {
                        box = 'vertical',
                        border = 'single',
                        title = '{title} {live} {flags}',
                        { win = 'input', height = 1, border = 'bottom' },
                        { win = 'list', border = 'none' },
                    },
                    {
                        win = 'preview',
                        title = '{preview}',
                        border = 'single',
                        width = 0.6
                    },
                },
            },
        },
    },
    keys = {
        {
            '<leader><space>',
            function() require('snacks').picker.smart() end,
            desc = 'Smart Find Files'
        },
        {
            '<leader>e',
            function() require('snacks').explorer() end,
            desc = 'File Explorer'
        },
        {
            '<leader>b',
            function() require('snacks').picker.buffers() end,
            desc = 'Buffers'
        },
        {
            '<leader>ff',
            function() require('snacks').picker.files() end,
            desc = 'Find Files',
        },
        {
            '<leader>fs',
            function() require('snacks').picker.grep() end,
            desc = 'Find Files',
        },
        {
            '<leader>gg',
            function() require('snacks').picker.git_status() end,
            desc = 'Git Status'
        },
        {
            '<leader>gl',
            function() require('snacks').picker.git_log() end,
            desc = 'Git Log'
        },
    },
}
