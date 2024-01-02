return function ()
    require('lualine').setup {
        options = {
            theme = vim.g.colors_name,
            component_separators = { left = '', right = '' },
            section_separators = { left = '', right = '' },
            disabled_filetypes = {
                statusline = {
                    'NvimTree',
                },
            },
            globalstatus = true,
        },
        extensions = {
            'toggleterm',
        },
        sections = {
            lualine_a = { 'mode' },
            lualine_b = { 'branch', 'diff' },
            lualine_c = { 'filename' },
            lualine_x = { 'encoding' },
            lualine_y = { { 'diagnostics', always_visible = true } },
            lualine_z = { 'location' }
        },
    }
end

