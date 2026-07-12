return function(event, group, callback)
    vim.api.nvim_create_autocmd(event, {
        group = vim.api.nvim_create_augroup(group, { clear = true }),
        callback = callback,
    })
end
