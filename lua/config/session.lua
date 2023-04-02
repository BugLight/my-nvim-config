return function ()
    require('auto-session').setup {
        auto_restore_enabled = false,
        auto_save_enabled = true,
        auto_session_use_git_branch = true,
    }
end

