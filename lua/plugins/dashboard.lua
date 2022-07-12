local db = require('dashboard')
local home = os.getenv('HOME')

db.session_directory = home .. '/.sessions'
db.preview_command = 'cat'
db.preview_file_path = home .. '/.splash'
db.preview_file_height = 13
db.preview_file_width = 102

db.custom_center = {
    {
        icon = '  ',
        desc = 'New File',
        action = 'DashboardNewFile'
    },
    {
        icon = '  ',
        desc = 'Old Files',
        action = 'Telescope oldfiles'
    },
    {
        icon = '  ',
        desc = 'Find File',
        action = 'Telescope find_files'
    },
    {
        icon = '  ',
        desc = 'Live Grep',
        action = 'Telescope live_grep'
    },
    {
        icon = '勒  ',
        desc = 'Load Last Session',
        action = 'SessionLoad'
    }
}

vim.cmd [[
augroup dashboard
autocmd VimLeavePre * SessionSave
augroup end
]]
