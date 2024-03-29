local function map(mode, lhs, rhs, desc, opts)
    local options = { noremap = true, silent = true, desc = desc }
    if opts then
        options = vim.tbl_extend('force', options, opts)
    end

    vim.keymap.set(mode, lhs, rhs, options)
end

vim.g.mapleader = ' '
vim.g.maplocalleader = ' '

-- nvim-tree
map('', '<C-w>n', '<CMD>NvimTreeFocus<CR>', 'Focus NvimTree window')

-- telescope
map('', '<leader>ff', '<CMD>Telescope find_files<CR>', 'Search by file name')
map('', '<leader>fg', '<CMD>Telescope live_grep<CR>',
    'Search for text in files')
map('', '<leader>fs', '<CMD>Telescope lsp_dynamic_workspace_symbols<CR>',
    'Search for LSP symbols')

-- toggleterm
map('', '<C-`>', '<CMD>ToggleTerm<CR>', 'Toggle terminal tab')

-- substitute
map('n', 's', function(opts) require('substitute').operator(opts) end, '')
map('n', 'ss', function(opts) require('substitute').line(opts) end, '')
map('n', 'S', function(opts) require('substitute').eol(opts) end, '')
map('x', 's', function(opts) require('substitute').visual(opts) end, '')

-- Filetype mappings
vim.api.nvim_create_autocmd('BufEnter', {
    group = vim.api.nvim_create_augroup('UserFileTypeMappings', {}),
    callback = function(e)
        local opts = { buffer = e.buf }
        local filetype = vim.bo.filetype

        if filetype == 'cpp' then
            map('n', 'gh', '<CMD>e %:r.h<CR>', 'Go to header file', opts)
            map('n', 'gs', '<CMD>e %:r.cpp<CR>', 'Go to source file', opts)
        end
    end
})

-- LSP mappings
vim.api.nvim_create_autocmd('LspAttach', {
    group = vim.api.nvim_create_augroup('UserLspMappings', {}),
    callback = function(e)
        local opts = { buffer = e.buf }

        map('n', '<C-}>', '<CMD>Lspsaga peek_definition<CR>',
            'Preview LSP definition', opts)
        map('n', '<C-]>', '<CMD>Lspsaga goto_definition<CR>',
            'Go to definition', opts)
        map('n', 'gd', '<CMD>Lspsaga goto_definition<CR>',
            'Go to definition', opts)
        map('n', 'gD', '<CMD>Lspsaga goto_type_definition<CR>',
            'Go to type definition', opts)

        map('n', 'gi', '<CMD>Lspsaga incoming_calls<CR>',
            'Show incoming calls', opts)
        map('n', 'go', '<CMD>Lspsaga outgoing_calls<CR>',
            'Show outgoing calls', opts)

        map('n', 'K', '<CMD>Lspsaga hover_doc<CR>',
            'Show documentation', opts)

        map({ 'n', 'v' }, '<leader>r', '<CMD>Lspsaga rename<CR>',
            'Rename symbol', opts)
        map({ 'n', 'v' }, '<leader>ca', '<CMD>Lspsaga code_action<CR>',
            'Code action', opts)

        map('n', '[e', '<CMD>Lspsaga diagnostic_jump_prev<CR>',
            'Go to previous diagnostic message', opts)
        map('n', ']e', '<CMD>Lspsaga diagnostic_jump_next<CR>',
            'Go to next diagnostic message', opts)

        map('n', 'gO', '<CMD>Lspsaga outline<CR>',
            'Show outline', opts)
    end
})

-- paster (https://github.com/BugLight/paster)
map('v', 'P', '<CMD>w !paster<CR>', 'Paste to pastebin.com')

-- cokeline
map('n', '<C-x>', function()
    local current = require('cokeline.buffers').get_current()
    if current then
        require('cokeline.mappings').by_index('close', current.index)
    end
end, 'Close current buffer')
map('n', '<C-j>', '<Plug>(cokeline-focus-next)', 'Focus next buffer',
    { noremap = false })
map('n', '<C-k>', '<Plug>(cokeline-focus-prev)', 'Focus previous buffer',
    { noremap = false })
-- map('n', '<C-l>', require('buglight.history').go_back,
--     'Go to previous buffer in history')
-- map('n', '<C-h>', require('buglight.history').show_popup,
--     'Show buffer history')
for i = 1,9 do
    map('n', ('<leader>%s'):format(i), ('<Plug>(cokeline-focus-%s)'):format(i),
        'Focus buffer ' .. i, { noremap = false })
end
map('n', '<leader>p', '<Plug>(cokeline-pick-focus)',
    'Pick buffer by file name', { noremap = false })

-- Git
map('n', '<leader>gg', '<CMD>vertical rightbelow Git<CR>', 'Git status')
map('n', '<leader>gl', '<CMD>vertical rightbelow Git log<CR>', 'Git log')
map('n', '<leader>gc', '<CMD>Git commit<CR>', 'Git commit')
map('n', '<leader>gb', '<CMD>Git blame<CR>', 'Git blame')

-- Codeium
map('i', '<C-j>', function() return vim.fn['codeium#CycleCompletions'](1) end,
    'Next codeium completion', { expr = true })
map('i', '<C-k>', function() return vim.fn['codeium#CycleCompletions'](-1) end,
    'Previous codeium completion', { expr = true })
map('i', '<C-g>', function() return vim.fn['codeium#Accept']() end,
    'Accept codeium completion', { expr = true })
map('i', '<C-a>', function() return vim.fn['codeium#Clear']() end,
    'Abort codeium completion', { expr = true })
