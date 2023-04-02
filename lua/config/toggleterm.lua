return function ()
    require('toggleterm').setup {
        insert_mappings = true,
        terminal_mappings = true,
        open_mapping = '<C-t>',
        direction = 'tab',
    }
end

