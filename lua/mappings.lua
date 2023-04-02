-- nvim-tree
vim.api.nvim_set_keymap('', '<C-w>n', '<CMD>NvimTreeFocus<CR>', { noremap = true, silent = true })

-- telescope
vim.api.nvim_set_keymap('', '<leader>ff', '<CMD>Telescope find_files<CR>', { noremap = true, silent = true })
vim.api.nvim_set_keymap('', '<leader>fg', '<CMD>Telescope live_grep<CR>', { noremap = true, silent = true })

-- bufferline
vim.api.nvim_set_keymap('', '<C-j>', '<CMD>BufferLineCycleNext<CR>', { noremap = true, silent = true })
vim.api.nvim_set_keymap('', '<C-k>', '<CMD>BufferLineCyclePrev<CR>', { noremap = true, silent = true })

-- toggleterm
vim.api.nvim_set_keymap('', '<C-t>', '<CMD>ToggleTerm<CR>', { noremap = true, silent = true })

-- substitute
vim.keymap.set('n', 's', '<CMD>lua require(\'substitute\').operator()<CR>', { noremap = true, silent = true })
vim.keymap.set('n', 'ss', '<CMD>lua require(\'substitute\').line()<CR>', { noremap = true, silent = true })
vim.keymap.set('n', 'S', '<CMD>lua require(\'substitute\').eol()<CR>', { noremap = true, silent = true })
vim.keymap.set('x', 's', '<CMD>lua require(\'substitute\').visual()<CR>', { noremap = true, silent = true })

-- lspsaga
vim.keymap.set('n', 'gh', '<CMD>Lspsaga lsp_finder<CR>')

vim.keymap.set('n', 'gd', '<CMD>Lspsaga goto_definition<CR>')
vim.keymap.set('n', '<leader>gd', '<CMD>Lspsaga peek_definition<CR>')

vim.keymap.set('n', 'K', '<CMD>Lspsaga hover_doc<CR>')

vim.keymap.set('n', '<leader>ca', '<CMD>Lspsaga code_action<CR>')

vim.keymap.set('n', '[e', '<CMD>Lspsaga diagnostic_jump_prev<CR>')
vim.keymap.set('n', ']e', '<CMD>Lspsaga diagnostic_jump_next<CR>')

