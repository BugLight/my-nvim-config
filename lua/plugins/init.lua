local lazypath = vim.fn.stdpath('data') .. '/lazy/lazy.nvim'
if not vim.loop.fs_stat(lazypath) then
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

require('lazy').setup({
    -------------------------- Required plugins -------------------------------

    -- Theme
    {
        'ribru17/bamboo.nvim',
        lazy = false,
        priority = 1000,
        config = require 'plugins.config.theme'
    },

    -- Discord integration
    {
        'andweeb/presence.nvim',
        config = require 'plugins.config.presence'
    },

    -- One click substitute
    {
        'gbprod/substitute.nvim',
        config = true
    },

    -- Tabs don't share buffers
    {
        'tiagovla/scope.nvim',
        config = true
    },

    -- Save and load session functionality
    {
        'BugLight/auto-session',
        config = require 'plugins.config.session'
    },

    -- Greeting screen
    {
        'goolord/alpha-nvim',
        config = require 'plugins.config.alpha'
    },

    -- Auto install lsp servers
    {
        'williamboman/mason.nvim',
        dependencies = { 'williamboman/mason-lspconfig.nvim' },
        build = ':MasonUpdate',
        config = require 'plugins.config.mason'
    },

    -- Completion plugin
    {
        'hrsh7th/nvim-cmp',
        dependencies = {
            'hrsh7th/cmp-nvim-lsp',
            'hrsh7th/cmp-buffer',
            'hrsh7th/cmp-path',
            'hrsh7th/cmp-cmdline',
            'L3MON4D3/LuaSnip',
            'rafamadriz/friendly-snippets',
            'saadparwaiz1/cmp_luasnip',
            'onsails/lspkind.nvim',
        },
        config = require 'plugins.config.cmp'
    },

    -- LSP config
    {
        'neovim/nvim-lspconfig',
        config = require 'plugins.config.lspconfig'
    },

    -- Show functions signatures
    {
        'ray-x/lsp_signature.nvim',
        dependencies = { 'neovim/nvim-lspconfig' },
        config = true
    },

    -- Git integration
    { 'tpope/vim-fugitive' },

    {
        'lewis6991/gitsigns.nvim',
        config = true
    },

    -- Status line
    {
        'nvim-lualine/lualine.nvim',
        config = require 'plugins.config.lualine'
    },

    -- Switch between buffers
    {
        'willothy/nvim-cokeline',
        config = require 'plugins.config.cokeline'
    },

    -- Visual indents
    {
        'lukas-reineke/indent-blankline.nvim',
        config = require 'plugins.config.indent'
    },

    -- Use local .editorconfig files
    { 'gpanders/editorconfig.nvim', },

    ---------------------------- Lazy plugins ---------------------------------

    -- Nerd font icons
    { 'nvim-tree/nvim-web-devicons', lazy = true },

    -- Plenary
    { 'nvim-lua/plenary.nvim', lazy = true },

    -- Vim config completions
    { 'folke/neodev.nvim', lazy = true },

    -- Files and directories tree
    {
        'nvim-tree/nvim-tree.lua',
        lazy = true,
        cmd = 'NvimTreeFocus',
        config = require 'plugins.config.tree'
    },

    -- Treesitter syntax highlighting
    {
        'nvim-treesitter/nvim-treesitter',
        lazy = true,
        event = 'BufRead',
        dependencies = {
            'HiPhish/rainbow-delimiters.nvim',
            'nvim-treesitter/nvim-treesitter-textobjects',
        },
        build = ':TSUpdate',
        config = require 'plugins.config.treesitter'
    },

    -- Extra lsp features
    {
        'nvimdev/lspsaga.nvim',
        lazy = true,
        event = 'LspAttach',
        config = require 'plugins.config.lspsaga'
    },

    -- Fuzzy search
    {
        'nvim-telescope/telescope.nvim',
        lazy = true,
        cmd = 'Telescope',
        config = true
    },

    -- Terminal
    {
        'akinsho/toggleterm.nvim',
        lazy = true,
        cmd = 'ToggleTerm',
        config = require 'plugins.config.toggleterm'
    },

    -- Better LSP experience for C/C++
    {
        'p00f/clangd_extensions.nvim',
        lazy = true,
        dependencies = { 'neovim/nvim-lspconfig' },
        ft = { 'c', 'cpp', 'h' },
        config = require 'plugins.config.clangd_extensions'
    },

    -- Comment/uncomment commands
    {
        'numToStr/Comment.nvim',
        lazy = true,
        event = 'BufRead',
        config = true
    },

    -- Virtual color column
    {
        'lukas-reineke/virt-column.nvim',
        lazy = true,
        event = 'BufRead',
        config = true
    },

    -- Codeium AI completion
    {
        'Exafunction/codeium.vim',
        lazy = true,
        event = 'BufRead',
        init = function()
            vim.g.codeium_disable_bindings = 1
        end
    },

    -- Which key
    {
        'folke/which-key.nvim',
        event = 'VeryLazy',
        init = function()
            vim.o.timeout = true
            vim.o.timeoutlen = 500
        end,
        config = true
    },
}, {
    ui = {
        border = 'rounded',
    },
})
