local map = vim.keymap.set

-- nvim-tree
map('', '<C-w>n', '<CMD>NvimTreeFocus<CR>', { noremap = true, silent = true })

-- telescope
map('', '<leader>ff', '<CMD>Telescope find_files<CR>', { noremap = true, silent = true })
map('', '<leader>fg', '<CMD>Telescope live_grep<CR>', { noremap = true, silent = true })
map('', '<leader>fs', '<CMD>Telescope lsp_dynamic_workspace_symbols<CR>', { noremap = true, silent = true })

-- toggleterm
map('', '<C-`>', '<CMD>ToggleTerm<CR>', { noremap = true, silent = true })

-- substitute
map('n', 's', '<CMD>lua require(\'substitute\').operator()<CR>', { noremap = true, silent = true })
map('n', 'ss', '<CMD>lua require(\'substitute\').line()<CR>', { noremap = true, silent = true })
map('n', 'S', '<CMD>lua require(\'substitute\').eol()<CR>', { noremap = true, silent = true })
map('x', 's', '<CMD>lua require(\'substitute\').visual()<CR>', { noremap = true, silent = true })

-- LSP mappings
vim.api.nvim_create_autocmd('LspAttach', {
    group = vim.api.nvim_create_augroup('UserLspMappings', {}),
    callback = function(e)
        local opts = { buffer = e.buf }

        map('n', '<C-}>', '<CMD>Lspsaga peek_definition<CR>', opts)
        map('n', '<C-]>', '<CMD>Lspsaga goto_definition<CR>', opts)
        map('n', 'gd', '<CMD>Lspsaga goto_definition<CR>', opts)
        map('n', 'gD', '<CMD>Lspsaga goto_type_definition<CR>', opts)

        map('n', 'gi', '<CMD>Lspsaga incoming_calls<CR>', opts)
        map('n', 'go', '<CMD>Lspsaga outgoing_calls<CR>', opts)

        map('n', 'K', '<CMD>Lspsaga hover_doc<CR>', opts)

        map({ 'n', 'v' }, '<leader>r', '<CMD>Lspsaga rename<CR>', opts)
        map({ 'n', 'v' }, '<leader>ca', '<CMD>Lspsaga code_action<CR>', opts)

        map('n', '[e', '<CMD>Lspsaga diagnostic_jump_prev<CR>', opts)
        map('n', ']e', '<CMD>Lspsaga diagnostic_jump_next<CR>', opts)

        map('n', 'gO', '<CMD>Lspsaga outline<CR>', opts)
    end
})

-- paster (https://github.com/BugLight/paster)
map('v', 'P', '<CMD>w !paster<CR>')

-- cokeline
map('n', '<C-x>', function()
    local current = require('cokeline.buffers').get_current()
    if current then
        require('cokeline.mappings').by_index('close', current.index)
    end
end, { silent = true })
map('n', '<C-j>', '<Plug>(cokeline-focus-next)', { silent = true })
map('n', '<C-k>', '<Plug>(cokeline-focus-prev)', { silent = true })
map('n', '<C-l>', require('history').go_back, { silent = true })
map('n', '<C-h>', require('history').show_popup, { noremap = true, silent = true })
for i = 1,9 do
    map('n', ('<leader>%s'):format(i), ('<Plug>(cokeline-focus-%s)'):format(i), { silent = true })
end
map('n', '<leader>p', '<Plug>(cokeline-pick-focus)', { silent = true })

