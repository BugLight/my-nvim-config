local M = {}

local utils = require('core.utils')

local history = {
    stack = {},
    bufs = {},
    size = 5,
}

function history:push(bufnr)
    local index = self.bufs[bufnr]
    if index == nil then
        table.insert(self.stack, bufnr)
        self.bufs[bufnr] = #self.stack
        if #self.stack > self:capacity() then
            self:pop()
        end
    else
        for i=index,#self.stack - 1 do
            self.stack[i] = self.stack[i + 1]
            self.bufs[self.stack[i]] = i
        end
        self.stack[#self.stack] = bufnr
        self.bufs[bufnr] = #self.stack
    end
end

function history:pop()
    if self:is_empty() then
        return nil
    end

    self.bufs[self.stack[1]] = nil
    for i=1,#self.stack - 1 do
        self.stack[i] = self.stack[i + 1]
        self.bufs[self.stack[i]] = i
    end

    local bufnr = table.remove(self.stack, #self.stack)
    return require('cokeline.buffers').get_buffer(bufnr)
end

function history:pop_last()
    if self:is_empty() then
        return nil
    end

    self.bufs[self.stack[#self.stack]] = nil

    local bufnr = table.remove(self.stack, #self.stack)
    return require('cokeline.buffers').get_buffer(bufnr)
end


function history:list()
    local list = {}
    for buf in self:iter() do
        table.insert(list, buf)
    end
    return list
end

function history:iter()
    local i = #self.stack
    return function()
        if i == 0 then
            return nil
        end

        local ret = self:get(i)
        i = i - 1
        return ret
    end
end

function history:get(idx)
    return require('cokeline.buffers').get_buffer(self.stack[idx])
end

function history:last()
    return self:get(#self.stack)
end

function history:capacity()
    return self.size
end

function history:len()
    return #self.stack
end

function history:is_empty()
    return #self.stack == 0
end

function history:contains(bufnr)
    return self.bufs[bufnr] ~= nil
end

function M.setup()
    history.size = _G.cokeline.history:capacity()
    _G.cokeline.history = history
end

function M.show_popup()
    local history_bufs = _G.cokeline.history:list()
    local history_lines = {}
    for i, buf in ipairs(history_bufs) do
        table.insert(history_lines, ('%s: %s%s'):format(i, buf.devicon.icon,
                                                        buf.filename))
    end

    local win = utils.popup('Buffers history', history_lines)
    local win_buf = vim.api.nvim_win_get_buf(win)

    vim.api.nvim_win_set_option(win, 'cursorline', true)

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

function M.go_back()
    local buf = _G.cokeline.history:pop_last()
    if buf then
        buf:focus()
    end
end

return M

