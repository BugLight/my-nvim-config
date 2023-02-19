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

local disabled_builtins = {}

for _, plugin in pairs(disabled_builtins) do
    vim.g['loaded_' .. plugin] = 1
end



return require('packer').startup(function(use)
    use 'wbthomason/packer.nvim'
    use 'nvim-lua/plenary.nvim'
    use 'gpanders/editorconfig.nvim'

    use {
        'neovim/nvim-lspconfig',
        requires = {
            {
                'ms-jpq/coq_nvim',
                run = 'python3 -m coq deps',
                requires = {
                    'ms-jpq/coq.artifacts',
                    'ms-jpq/coq.thirdparty',
                },
            },
            {
                'williamboman/nvim-lsp-installer'
            },
        },
        config = function()
            require 'plugins.lsp'
        end
    }

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
        'catppuccin/nvim',
        as = 'catppuccin',
        event = 'UIEnter',
        config = function()
            require 'theme'
        end
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
        after = 'catppuccin',
        requires = { 'nvim-tree/nvim-web-devicons' },
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
        'nvim-tree/nvim-tree.lua',
        requires = { 'nvim-tree/nvim-web-devicons' },
        tag = 'nightly',
        cmd = { 'NvimTreeOpen', 'NvimTreeFocus', 'NvimTreeToggle' },
        config = function()
            require 'plugins.tree'
        end
    }
 
    use {
        'lukas-reineke/indent-blankline.nvim',
        after = 'catppuccin',
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
        tag = 'v3.*',
        after = 'catppuccin',
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

    use {
        'glepnir/dbsession.nvim',
        config = function()
            require('dbsession').setup {
                auto_save_on_exit = true,
            }
        end
    }

    use {
        'numToStr/Comment.nvim',
        event = 'BufRead',
        config = function()
            require 'plugins.comment'
        end
    }

    use {
        'tiagovla/scope.nvim',
        config = function()
            require('scope').setup()
        end
    }

    if packer_bootstrap then
        require('packer').sync()
    end
end)
