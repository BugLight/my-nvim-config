return function ()
    local rainbow_delimiters = require 'rainbow-delimiters'

    vim.g.rainbow_delimiters = {
        strategy = {
            [''] = rainbow_delimiters.strategy['global'],
            vim = rainbow_delimiters.strategy['local'],
        },
        query = {
            [''] = 'rainbow-delimiters',
            lua = 'rainbow-blocks',
        },
        highlight = {
            'RainbowDelimiterRed',
            'RainbowDelimiterYellow',
            'RainbowDelimiterBlue',
            'RainbowDelimiterOrange',
            'RainbowDelimiterGreen',
            'RainbowDelimiterViolet',
            'RainbowDelimiterCyan',
        },
    }

    require('nvim-treesitter.configs').setup {
        ensure_installed = {
            'c',
            'cpp',
            'python',
            'lua',
            'javascript',
            'html',
            'vue',
            'markdown',
            'markdown_inline',
            'rust',
        },
        highlight = {
            enable = true,
        },
        textobjects = {
            select = {
                enable = true,
                lookahead = true,  -- Automatically jump forward to textobj, similar to targets.vim
                keymaps = {
                    ['ac'] = '@class.outer',
                    ['af'] = '@function.outer',
                    ['if'] = '@function.inner',
                    ['as'] = '@scope',
                    ['aa'] = '@parameter.outer',
                    ['ia'] = '@parameter.inner',
                },
            },
            swap = {
                enable = true,
                swap_next = {
                    ['<leader>sa'] = '@parameter.inner',
                    ['<leader>sf'] = '@function.outer',
                },
                swap_previous = {
                    ['<leader>sA'] = '@parameter.inner',
                    ['<leader>sF'] = '@function.outer',
                },
            },
            move = {
                enable = true,
                set_jumps = true,  -- whether to set jumps in the jumplist
                goto_next_start = {
                    [']]'] = '@class.outer',
                    [']f'] = '@function.outer',
                    [']a'] = '@parameter.inner',
                    [']s'] = '@scope',
                },
                goto_previous_start = {
                    ['[['] = '@class.outer',
                    ['[f'] = '@function.outer',
                    ['[a'] = '@parameter.inner',
                    ['[s'] = '@scope',
                },
            },
        },
    }
end

