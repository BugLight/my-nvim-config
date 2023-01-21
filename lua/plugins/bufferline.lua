require('bufferline').setup {
    highlights = require('catppuccin.groups.integrations.bufferline').get(),
    options = {
        separator_style = 'thick',
        offsets = {
            {
                filetype = 'NvimTree',
                highlighting = 'Directory',
            },
        },
    }
}

