local M = {}

function M.autocmd(event, group, callback)
    vim.api.nvim_create_autocmd(event, {
        group = vim.api.nvim_create_augroup(group, { clear = true }),
        callback = callback,
    })
end

function M.setup()
    ------------------------ Core default autocommands ------------------------
    local autocmd = M.autocmd

    -- Trim trailing whitespaces on save
    autocmd('BufWritePre', 'UserTrimTrailingWhitespaces', function(args)
        local lines = vim.api.nvim_buf_get_lines(args.buf, 0, -1, false)
        for i, line in ipairs(lines) do
            lines[i] = string.gsub(line, '%s*$', '')
        end
        vim.api.nvim_buf_set_lines(args.buf, 0, -1, false, lines)
    end)

    -- Highlight when yanking (copying) text
    autocmd('TextYankPost', 'UserHighlightYank', function()
        vim.highlight.on_yank()
    end)
end

return M
