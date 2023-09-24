return function ()
    require('presence').setup {
        auto_update = true,
        neovim_image_text = 'The One True Text Editor',
        main_imag = 'file',
        debounce_timeout = 10,
        blacklist = {},
        buttons = true,
        show_time = false,
        editing_text = 'Editing %s',
        file_explorer_text = 'Browsing %s',
        git_commit_text = 'Committing changes',
        plugin_manager_text = 'Managing plugins',
        reading_text = 'Reading %s',
        workspace_text = 'Working on %s',
        line_number_text = 'Line %s out of %s',
    }
end
