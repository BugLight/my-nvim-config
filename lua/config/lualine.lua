return function ()
    require('lualine').setup {
        options = {
            theme = vim.g.colors_name,
        },
        extensions = {
            'nvim-tree',
            'toggleterm',
        }
    }
end

