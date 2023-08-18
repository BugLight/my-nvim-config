local module = {}

function module.popup(title, lines, options)
    local defaults = {
        width = 50,
        height = 10,
        zindex = 99,
        border = 'single',
    }
    if options then
        for k, v in pairs(defaults) do
            if options[k] == nil then
                options[k] = v
            end
        end
    else
        options = defaults
    end

    local buf = vim.api.nvim_create_buf(false, true)
    vim.api.nvim_buf_set_lines(buf, 0, -1, true, lines)
    vim.api.nvim_buf_set_option(buf, 'modifiable', false)

    local col = (vim.o.columns - options.width) / 2
    local row = (vim.o.lines - options.height) / 2
    return vim.api.nvim_open_win(buf, true, {
        relative = 'editor',
        width = options.width,
        height = options.height,
        col = col,
        row = row,
        zindex = options.zindex,
        style = 'minimal',
        border = options.border,
        title = title,
        title_pos = 'center',
    })
end

function module.buf_set_keymap(buf, mode, lhs, rhs)
    vim.api.nvim_buf_set_keymap(buf, mode, lhs, '', {
        callback = rhs,
        silent = true,
        noremap = true,
    })
end

return module

