require('dashboard').setup {
    theme = 'doom',
    config = {
        center = {
            {
                icon = '  ',
                icon_hl = 'Title',
                desc = 'New File',
                desc_hl = 'Title',
                action = 'enew\nNvimTreeToggle'
            },
            {
                icon = '  ',
                icon_hl = 'Title',
                desc = 'Old Files',
                desc_hl = 'Title',
                action = 'Telescope oldfiles'
            },
            {
                icon = '  ',
                icon_hl = 'Title',
                desc = 'Find File',
                desc_hl = 'Title',
                action = 'Telescope find_files'
            },
            {
                icon = '  ',
                icon_hl = 'Title',
                desc = 'Live Grep',
                desc_hl = 'Title',
                action = 'Telescope live_grep'
            },
            {
                icon = '勒 ',
                icon_hl = 'Title',
                desc = 'Load Last Session',
                desc_hl = 'Title',
                action = 'RestoreSession\nNvimTreeToggle'
            },
        },
    },
    preview = {
        command = 'bash -c "cat $HOME/.splash"',
        file_path = '',
        file_height = 20,
        file_width = 102,
    },
}
