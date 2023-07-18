function read_header_from_file(path)
    local lines = {}
    path = vim.fs.normalize(path)
    for line in io.lines(path) do
        table.insert(lines, line)
    end
    return lines
end

return function ()
    local alpha = require('alpha')
    local dashboard = require('alpha.themes.dashboard')

    local header = {
        type = 'text',
        val = read_header_from_file('$HOME/.splash'),
        opts = {
            position = 'center',
        }
    }

    local buttons = {
        type = 'group',
        val = {
            {
                type = 'text',
                val = 'Quick actions',
                opts = { position = 'center' }
            },
            {
                type = 'padding',
                val = 1,
            },
            dashboard.button('<leader>n', '  New File', ':enew | NvimTreeFocus<CR>'),
            dashboard.button('<leader>o', '  Old Files', ':Telescope oldfiles<CR>'),
            dashboard.button('<leader>ff', '  Find File', ':Telescope find_files<CR>'),
            dashboard.button('<leader>fg', '  Live Grep', ':Telescope live_grep<CR>'),
        }
    }

    local sessions = {
        type = 'group',
        val = function ()
            local autosession = require('auto-session')
            local sessions_root = autosession.get_root_dir()
            local sessions = autosession.get_session_files()
            local val = {
                {
                    type = 'text',
                    val = 'Recent sessions',
                    opts = { position = 'center' }
                },
                {
                    type = 'padding',
                    val = 1,
                },
            }
            table.sort(sessions, function (a, b)
                local a_time = vim.fn.getftime(sessions_root .. a.path)
                local b_time = vim.fn.getftime(sessions_root .. b.path)
                return a_time > b_time
            end)
            for i, session in ipairs(sessions) do
                if i > 5 then
                    break
                end
                local sc = '<leader>l' .. tostring(i)
                local session_path = sessions_root .. session.path
                table.insert(val, {
                    type = 'button',
                    val = tostring(i) .. '\t' .. session.display_name,
                    on_press = function ()
                        autosession.RestoreSession(session_path)
                        require('nvim-tree.api').tree.open()
                    end,
                    opts = {
                        keymap = { 'n', sc, ':RestoreSession ' .. session_path .. '<CR>', {} },
                        position = 'center',
                        width = 80,
                        shortcut = sc,
                        align_shortcut = 'right',
                        hl_shortcut = 'Keyword',
                    }
                })
            end
            return val
        end,
    }

    alpha.setup {
        layout = {
            {
                type = 'padding',
                val = 2,
            },
            header,
            {
                type = 'padding',
                val = 2,
            },
            buttons,
            {
                type = 'padding',
                val = 2,
            },
            sessions,
        },
    }
end

