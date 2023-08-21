local module = {}

function module.setup()
    vim.api.nvim_create_autocmd('BufWritePre', {
        callback = function(args) module.buf_trim_trailing_whitespaces(args.buf) end
    })
end

function module.trim_trailing_whitespaces(s)
    return string.gsub(s, '%s*$', '')
end

function module.buf_trim_trailing_whitespaces(buf)
    local lines = vim.api.nvim_buf_get_lines(buf, 0, -1, false)
    for i, line in ipairs(lines) do
        lines[i] = module.trim_trailing_whitespaces(line)
    end
    vim.api.nvim_buf_set_lines(buf, 0, -1, false, lines)
end

return module
