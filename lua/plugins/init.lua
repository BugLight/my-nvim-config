local fn = vim.fn
local install_path = fn.stdpath('data')..'/site/pack/packer/start/packer.nvim'
if fn.empty(fn.glob(install_path)) > 0 then
  packer_bootstrap = fn.system({'git', 'clone', '--depth', '1', 'https://github.com/wbthomason/packer.nvim', install_path})
end

vim.cmd [[
 packadd packer.nvim
 augroup packer_user_config
    autocmd!
    autocmd BufWritePost */nvim/lua/plugins/*.lua source <afile> | PackerCompile
  augroup end
]]

return require('packer').startup(function(use)
    use 'wbthomason/packer.nvim'
    use 'nvim-lua/plenary.nvim'
    use 'gpanders/editorconfig.nvim'
    use 'williamboman/nvim-lsp-installer'

    use {
        'nvim-telescope/telescope.nvim',
        cmd = 'Telescope',
        config = function()
            require 'plugins.telescope'
        end
    }

    use {
        'akinsho/toggleterm.nvim',
        tag = 'v2.*',
        cmd = 'ToggleTerm',
        config = function()
            require 'plugins.toggleterm'
        end
    }

    use {
        'folke/tokyonight.nvim',
        event = 'UIEnter',
        config = function()
            require 'theme'
        end
    }

    use {
        'neovim/nvim-lspconfig',
        event = 'BufRead',
        config = function()
            require 'plugins.lspconfig'
            require 'plugins.lspinstaller'
        end
    }
 
    use {
        'hrsh7th/nvim-cmp',
        event = 'InsertEnter',
        config = function()
            require 'plugins.cmp'
        end
    }

    use {
        'L3MON4D3/LuaSnip',
        after = 'nvim-cmp'
    }

    use {
        'saadparwaiz1/cmp_luasnip',
        after = 'LuaSnip'
    }

    use {
        'hrsh7th/cmp-nvim-lsp',
        after = 'nvim-cmp'
    }
 
    use {
        'hrsh7th/cmp-buffer',
        after = 'nvim-cmp'
    }
 
    use {
        'hrsh7th/cmp-path',
        after = 'nvim-cmp'
    }
 
    use {
        'hrsh7th/cmp-cmdline',
        after = 'nvim-cmp'
    }
 
    use {
        'p00f/clangd_extensions.nvim',
        wants = 'nvim-lspconfig',
        ft = { 'c', 'cpp', 'h' },
        config = function()
            require 'plugins.clangd_extensions'
        end
    }
 
    use {
        'nvim-lualine/lualine.nvim',
        after = 'tokyonight.nvim',
        requires = { 'kyazdani42/nvim-web-devicons', opt = true },
        config = function()
            require 'plugins.lualine'
        end
    }
 
    use {
        'lewis6991/gitsigns.nvim',
        after = 'plenary.nvim',
        config = function()
            require 'plugins.gitsigns'
        end
    }
 
    use {
        'ray-x/lsp_signature.nvim',
        after = 'nvim-lspconfig'
    }
 
    use {
        'kyazdani42/nvim-tree.lua',
        cmd = { 'NvimTreeOpen', 'NvimTreeFocus', 'NvimTreeToggle' },
        config = function()
            require 'plugins.tree'
        end
    }
 
    use {
        'lukas-reineke/indent-blankline.nvim',
        after = 'tokyonight.nvim',
        config = function()
            require 'plugins.indent'
        end
    }
 
    use {
        'nvim-treesitter/nvim-treesitter',
        event = 'BufRead',
        run = ':TSUpdate',
        config = function()
            require 'plugins.treesitter'
        end
    }
 
    use {
        'akinsho/bufferline.nvim',
        after = 'tokyonight.nvim',
        config = function()
            require 'plugins.bufferline'
        end
    }
 
    use {
        'glepnir/dashboard-nvim',
        config = function()
            require 'plugins.dashboard'
        end
    }

    if packer_bootstrap then
        require('packer').sync()
    end
end)
