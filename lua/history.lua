local module = {}

local utils = require('utils')

function module.show_popup()
    local history_bufs = _G.cokeline.history:list()
    local history_lines = {}
    for i, buf in ipairs(history_bufs) do
        table.insert(history_lines, ('%s: %s%s'):format(i, buf.devicon.icon,
                                                        buf.filename))
    end

    local win = utils.popup('Buffers history', history_lines)
    local win_buf = vim.api.nvim_win_get_buf(win)

    utils.buf_set_keymap(win_buf, 'n', '<Esc>', function()
        vim.api.nvim_win_close(win, true)
    end)

    utils.buf_set_keymap(win_buf, 'n', '<CR>', function()
        local i = vim.api.nvim_win_get_cursor(win)[1]
        vim.api.nvim_win_close(win, true)
        history_bufs[i]:focus()
    end)

    for i, buf in ipairs(history_bufs) do
        utils.buf_set_keymap(win_buf, 'n', ('%s'):format(i), function()
            vim.api.nvim_win_close(win, true)
            buf:focus()
        end)
    end
end

function module.go_back()
    local buf = _G.cokeline.history:last()
    if buf then
        buf:focus()
    end
end

return module

