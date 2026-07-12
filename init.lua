-------------------------- Setup core functionality ---------------------------

require('core.options')
require('core.mappings')
require('core.autocmds')
require('core.treesitter').setup()

-------------------------------- Setup plugins --------------------------------

local lazypath = vim.fn.stdpath('data') .. '/lazy/lazy.nvim'
if not (vim.uv or vim.loop).fs_stat(lazypath) then
    vim.fn.system({
        'git',
        'clone',
        '--filter=blob:none',
        'https://github.com/folke/lazy.nvim.git',
        '--branch=stable', -- latest stable release
        lazypath,
    })
end
vim.opt.rtp:prepend(lazypath)

local disabled_builtins = {}

for _, plugin in pairs(disabled_builtins) do
    vim.g['loaded_' .. plugin] = 1
end

require('lazy').setup {
    spec = {
        import = 'plugins',
    },
    install = {
        colorscheme = { 'default' },
    },
    ui = {
        border = 'single',
    },
}
