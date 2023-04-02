local fn = vim.fn
local install_path = fn.stdpath('data')..'/site/pack/packer/start/packer.nvim'
if fn.empty(fn.glob(install_path)) > 0 then
  packer_bootstrap = fn.system({'git', 'clone', '--depth', '1', 'https://github.com/wbthomason/packer.nvim', install_path})
end

vim.cmd.packadd('packer.nvim')

local disabled_builtins = {}

for _, plugin in pairs(disabled_builtins) do
    vim.g['loaded_' .. plugin] = 1
end

return require('packer').startup(function(use)
    ---------------------------- Required plugins -----------------------------

    -- The packer itself
    use { 'wbthomason/packer.nvim' }

    -- Use local .editorconfig files
    use { 'gpanders/editorconfig.nvim' }

    -- Faster startup
    use {
        'lewis6991/impatient.nvim',
        config = function()
            require 'impatient'
        end
    }

    -- One click substitute
    use {
        'gbprod/substitute.nvim',
        config = require 'config.substitute'
    }

    -- Tabs don't share buffers
    use {
        'tiagovla/scope.nvim',
        config = function()
            require('scope').setup()
        end
    }

    -- Save and load session functionality
    use {
        'rmagatti/auto-session',
        config = require 'config.session'
    }

    -- Greeting screen
    use {
        'goolord/alpha-nvim',
        config = require 'config.alpha'
    }

    -- Auto install lsp servers
    use {
        'williamboman/mason.nvim',
        requires = {
            'williamboman/mason-lspconfig.nvim',
        },
        run = ':MasonUpdate',
        config = require 'config.mason'
    }

    -- Vim config completions
    use { 'folke/neodev.nvim' }

    -- AI completions
    use {
        'tzachar/cmp-tabnine',
        run='./install.sh',
        requires = {
            'hrsh7th/nvim-cmp',
        }
    }

    -- Completion plugin
    use {
        'hrsh7th/nvim-cmp',
        after = 'cmp-tabnine',
        requires = {
            'hrsh7th/cmp-nvim-lsp',
            'hrsh7th/cmp-buffer',
            'hrsh7th/cmp-path',
            'hrsh7th/cmp-cmdline',
            'L3MON4D3/LuaSnip',
            'rafamadriz/friendly-snippets',
            'saadparwaiz1/cmp_luasnip',
            'onsails/lspkind.nvim',
        },
        config = require 'config.cmp'
    }

    -- LSP config
    use {
        'neovim/nvim-lspconfig',
        after = {
            'mason.nvim',
            'nvim-cmp',
        },
        config = require 'config.lspconfig'
    }

    -- Files and directories tree
    use {
        'nvim-tree/nvim-tree.lua',
        requires = {
            'nvim-tree/nvim-web-devicons'
        },
        tag = 'nightly',
        config = require 'config.tree'
    }

    ------------------------------ Lazy plugins -------------------------------

    use {
        'glepnir/lspsaga.nvim',
        event = 'LspAttach',
        branch = 'main',
        requires = {
            'nvim-tree/nvim-web-devicons',
        },
        config = function()
            require('lspsaga').setup {}
        end
    }

    -- Fuzzy search
    use {
        'nvim-telescope/telescope.nvim',
        cmd = 'Telescope',
        config = require 'config.telescope'
    }

    -- Terminal
    use {
        'akinsho/toggleterm.nvim',
        tag = 'v2.*',
        cmd = 'ToggleTerm',
        config = require 'config.toggleterm'
    }

    -- Theme
    use {
        'catppuccin/nvim',
        as = 'theme',
        event = 'UIEnter',
        config = require 'config.theme'
    }

    -- Better LSP experience for C/C++
    use {
        'p00f/clangd_extensions.nvim',
        after = 'nvim-lspconfig',
        ft = { 'c', 'cpp', 'h' },
        config = require 'config.clangd_extensions'
    }

    -- Status line
    use {
        'nvim-lualine/lualine.nvim',
        after = 'theme',
        requires = { 'nvim-tree/nvim-web-devicons' },
        config = require 'config.lualine'
    }

    -- Git integration
    use {
        'lewis6991/gitsigns.nvim',
        requires = { 'nvim-lua/plenary.nvim' },
        config = require 'config.gitsigns'
    }

    -- Show functions signatures
    use {
        'ray-x/lsp_signature.nvim',
        after = 'nvim-lspconfig',
        config = function()
            require('lsp_signature').setup {}
        end
    }

    -- Visual indents
    use {
        'lukas-reineke/indent-blankline.nvim',
        after = 'theme',
        config = require 'config.indent'
    }

    -- Treesitter syntax highlighting
    use {
        'nvim-treesitter/nvim-treesitter',
        requires = {
            'HiPhish/nvim-ts-rainbow2',
            'nvim-treesitter/nvim-treesitter-textobjects',
        },
        run = ':TSUpdate',
        config = require 'config.treesitter'
    }

    -- Switch between buffers
    use {
        'akinsho/bufferline.nvim',
        tag = 'v3.*',
        after = 'theme',
        config = require 'config.bufferline'
    }

    -- Comment/uncomment commands
    use {
        'numToStr/Comment.nvim',
        event = 'BufRead',
        config = function()
            require('Comment').setup()
        end
    }

    if packer_bootstrap then
        require('packer').sync()
    end
end)
