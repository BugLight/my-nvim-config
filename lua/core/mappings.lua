require('utils.autocmd')('VimEnter', 'UserMappings', function(e)
    local map = require('snacks.keymap').set

    -- Core mappings
    map('n', '<Esc>', '<CMD>nohlsearch<CR>')
    map('n', '<leader>n', '<CMD>set relativenumber!<CR>', {
        desc = 'Toggle relative line numbers',
    })
    map('n', 'dd', function()
        if vim.api.nvim_get_current_line():match("^%s*$") then
            return '"_dd'
        else
            return 'dd'
        end
    end, {
        desc = 'Smart delete line',
        expr = true
    })
    map({ 'n', 'x' }, 'x', '"_x')
    map({ 'n', 'x' }, 'X', '"_X')
    map('x', '.', ':norm .<CR>')
    map('x', '@', ':norm @q<CR>')

    -- Paster (https://github.com/BugLight/paster)
    map('v', '<leader>p', '<CMD>w !paster<CR>', {
        desc = 'Paste to pastebin.com',
    })

    -- Filetype mappings
    map('n', 'gh', '<CMD>e %:r.h<CR>', {
        desc = 'Go to header file',
        ft = 'cpp',
    })
    map('n', 'gs', '<CMD>e %:r.cpp<CR>', {
        desc = 'Go to source file',
        ft = 'cpp',
    })

    -- LSP mappings
    map('n', 'gD', vim.lsp.buf.declaration, {
        desc = 'Go to declaration',
        lsp = { method = 'textDocument/declaration' }
    })
    map('n', 'gd', vim.lsp.buf.definition, {
        desc = 'Go to definition',
        lsp = { method = 'textDocument/definition' }
    })
end)
