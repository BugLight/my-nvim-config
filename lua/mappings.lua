-- nvim-tree
vim.api.nvim_set_keymap('', '<C-n>', '<CMD>NvimTreeFocus<CR>', { noremap = true, silent = true })

-- telescope
vim.api.nvim_set_keymap('', '<C-f>', '<CMD>Telescope live_grep<CR>', { noremap = true, silent = true })

-- bufferline
vim.api.nvim_set_keymap('', '<C-j>', '<CMD>BufferLineCycleNext<CR>', { noremap = true, silent = true })
vim.api.nvim_set_keymap('', '<C-k>', '<CMD>BufferLineCyclePrev<CR>', { noremap = true, silent = true })

-- toggleterm
vim.api.nvim_set_keymap('', '<C-t>', '<CMD>ToggleTerm<CR>', { noremap = true, silent = true })

-- substitute
vim.keymap.set("n", "s", "<cmd>lua require('substitute').operator()<cr>", { noremap = true, silent = true })
vim.keymap.set("n", "ss", "<cmd>lua require('substitute').line()<cr>", { noremap = true, silent = true })
vim.keymap.set("n", "S", "<cmd>lua require('substitute').eol()<cr>", { noremap = true, silent = true })
vim.keymap.set("x", "s", "<cmd>lua require('substitute').visual()<cr>", { noremap = true, silent = true })
