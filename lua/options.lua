----------------------------- General options --------------------------------
--
vim.o.encoding = 'UTF-8'
vim.o.compatible = false
vim.o.ignorecase = true
vim.o.hlsearch = true
vim.o.incsearch = true
vim.o.tabstop = 4
vim.o.softtabstop = 4
vim.o.expandtab = true
vim.o.shiftwidth = 4
vim.o.autoindent = true
vim.o.number = true
vim.o.wildmode = 'longest,list'
vim.o.cc = 80
vim.o.clipboard = 'unnamedplus'
vim.o.ttyfast = true
vim.o.lazyredraw = true
vim.o.completeopt = 'menu,menuone,noselect'
vim.o.tgc = true
vim.g.mapleader = ' '
vim.g.maplocalleader = ' '
vim.o.sessionoptions = 'blank,buffers,curdir,folds,help,tabpages,winsize,' ..
                       'winpos,terminal,localoptions'

--------------------------- Neovide GUI options ------------------------------

vim.o.guifont = 'mononoki Nerd Font:h16'

-- Helper function for transparency formatting
local alpha = function()
    return string.format("%x", math.floor((255 * vim.g.transparency) or 0.8))
end
-- g:neovide_transparency should be 0 if you want to unify transparency of
-- content and title bar.
vim.g.neovide_transparency = 0.0
vim.g.transparency = 0.8
vim.g.neovide_background_color = "#0f1117" .. alpha()

vim.g.neovide_hide_mouse_when_typing = true

vim.g.neovide_remember_window_size = true

vim.g.neovide_input_use_logo = false

