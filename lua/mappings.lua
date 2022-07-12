vim.api.nvim_set_keymap('', '<C-n>', '<CMD>NvimTreeFocus<CR>', { noremap = true, silent = true })

vim.api.nvim_set_keymap('', '<C-f>', '<CMD>Telescope live_grep<CR>', { noremap = true, silent = true })

vim.api.nvim_set_keymap('', '<C-j>', '<CMD>BufferLineCycleNext<CR>', { noremap = true, silent = true })
vim.api.nvim_set_keymap('', '<C-k>', '<CMD>BufferLineCyclePrev<CR>', { noremap = true, silent = true })

vim.api.nvim_set_keymap('', '<C-t>', '<CMD>ToggleTerm<CR>', { noremap = true, silent = true })

