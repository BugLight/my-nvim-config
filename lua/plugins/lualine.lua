return {
    'nvim-lualine/lualine.nvim',
    dependencies = { 'nvim-tree/nvim-web-devicons' },
    opts = {
        options = {
            theme = vim.g.colors_name,
            component_separators = { left = '', right = '' },
            section_separators = { left = '', right = '' },
            globalstatus = true,
        },
        sections = {
            lualine_a = { 'mode' },
            lualine_b = { 'branch', 'diff' },
            lualine_c = { 'filetype', 'filename' },
            lualine_x = { 'encoding' },
            lualine_y = { { 'diagnostics', always_visible = true } },
            lualine_z = { 'location' }
        },
    },
}
