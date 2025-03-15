local M = {}

local autocmd = require('core.autocmds').autocmd

local function _set_keymap(mode, lhs, rhs, opts)
    local defaults = {
        noremap = true,
        silent = true,
    }
    opts = vim.tbl_extend('keep', opts or {}, defaults)

    vim.keymap.set(mode, lhs, rhs, opts)
end

function M.map(mode, lhs, rhs, desc, opts)
    opts = vim.deepcopy(opts or {})
    opts.desc = desc

    if opts.ft then
        autocmd('BufEnter', 'UserMappings/' .. opts.ft .. '/' .. lhs, function(e)
            if vim.bo.filetype == opts.ft then
                local _opts = vim.deepcopy(opts)
                _opts.buffer = e.buf
                _opts.ft = nil
                _set_keymap(mode, lhs, rhs, _opts)
            end
        end)
    else
        _set_keymap(mode, lhs, rhs, opts)
    end
end

function M.setup()
    M.leader = ' '

    -- Set leader key
    vim.g.mapleader = M.leader
    vim.g.maplocalleader = M.leader

    ------------------------ Core default mappings ----------------------------
    local map = M.map

    map('n', '<Esc>', '<CMD>nohlsearch<CR>')

    map('n', '<leader>n', '<CMD>set relativenumber!<CR>', 'Toggle relative line numbers')

    map('n', 'dd', function()
        if vim.api.nvim_get_current_line():match("^%s*$") then
            return '"_dd'
        else
            return 'dd'
        end
    end, 'Smart delete line', { expr = true })

    map({ 'n', 'x' }, 'x', '"_x')
    map({ 'n', 'x' }, 'X', '"_X')

    map('x', '.', ':norm .<CR>')
    map('x', '@', ':norm @q<CR>')

    -- Paster (https://github.com/BugLight/paster)
    map('v', '<leader>p', '<CMD>w !paster<CR>', 'Paste to pastebin.com')

    -- Filetype mappings
    map('n', 'gh', '<CMD>e %:r.h<CR>', 'Go to header file', { ft = 'cpp' })
    map('n', 'gs', '<CMD>e %:r.cpp<CR>', 'Go to source file', { ft = 'cpp' })

    -- LSP mappings
    autocmd('LspAttach', 'UserLspMappings', function(e)
        local opts = { buffer = e.buf }
        local lsp = vim.lsp.get_client_by_id(e.data.client_id)

        if not lsp then
            vim.notify(
                'Failed to set LSP mappings: client not found',
                vim.log.levels.ERROR
            )
            return
        end

        if lsp.supports_method('textDocument/rename') then
            map('n', 'gr', vim.lsp.buf.rename, 'Rename symbol', opts)
        end

        if lsp.supports_method('textDocument/definition') then
            map('n', 'gd', vim.lsp.buf.definition, 'Go to definition', opts)
        end

        if lsp.supports_method('textDocument/declaration') then
            map('n', 'gD', vim.lsp.buf.declaration, 'Go to declaration', opts)
        end
    end)
end

return M
