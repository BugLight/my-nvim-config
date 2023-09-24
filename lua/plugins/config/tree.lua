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

    -- Setup hightlights
    vim.cmd.hi('clear', 'NvimTreeNormal')
    vim.cmd.hi('link', 'NvimTreeNormal', 'Normal')
    vim.cmd.hi('link', 'NvimTreeCursorLine', 'PmenuSel')
end

