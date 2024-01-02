return function ()
    require('nvim-tree').setup {
        hijack_cursor = true,
        view = {
        },
        renderer = {
            group_empty = true,
            root_folder_label = false,
        },
    }
end

