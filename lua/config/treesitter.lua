return function ()
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
        },
        highlight = {
            enable = true,
        },
        rainbow = {
            enable = true,
            strategy = require('ts-rainbow').strategy['global'],
            query = 'rainbow-parens',
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

