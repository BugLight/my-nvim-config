return function ()
    local alpha = require('alpha')
    local dashboard = require('alpha.themes.dashboard')

    local default_text = {}
    local custom_text = require('core.utils').read_lines('$HOME/.splash')
    local header = {
        type = 'text',
        val = custom_text or default_text,
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
            dashboard.button('<leader>nf', '  New File',
                             ':enew | NvimTreeFocus<CR>',
                             { desc = 'New file' }),
            dashboard.button('<leader>nn', '  New Note',
                             '<Plug>(neorg.dirman.new-note)',
                             { desc = 'New note' }),
            dashboard.button('<leader>o', '  Old Files',
                             ':Telescope oldfiles<CR>',
                             { desc = 'Old files' }),
            dashboard.button('<leader>ff', '  Find File',
                             ':Telescope find_files<CR>'),
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
                local sc = '<leader>' .. tostring(i)
                local session_path = sessions_root .. session.path
                table.insert(val, {
                    type = 'button',
                    val = tostring(i) .. '\t' .. session.display_name,
                    on_press = function ()
                        autosession.RestoreSession(session_path)
                        require('nvim-tree.api').tree.open()
                    end,
                    opts = {
                        keymap = { 'n', sc, ':SessionRestoreFromFile ' ..
                                   session_path .. '<CR>:NvimTreeFocus<CR>',
                                   { desc = 'Restore session ' ..
                                            session.display_name } },
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

