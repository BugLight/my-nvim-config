local function autocmd(event, group, callback)
    vim.api.nvim_create_autocmd(event, {
        group = vim.api.nvim_create_augroup(group, { clear = false }),
        callback = callback,
    })
end

-- Trim trailing whitespaces on save
autocmd('BufWritePre', 'UserTrimTrailingWhitespaces', function(args)
    local lines = vim.api.nvim_buf_get_lines(args.buf, 0, -1, false)
    for i, line in ipairs(lines) do
        lines[i] = string.gsub(line, '%s*$', '')
    end
    vim.api.nvim_buf_set_lines(args.buf, 0, -1, false, lines)
end)

