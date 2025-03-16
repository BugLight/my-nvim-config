return {
    'olimorris/codecompanion.nvim',
    dependencies = {
        'nvim-lua/plenary.nvim',
        'nvim-treesitter/nvim-treesitter',
    },
    opts = {
        display = {
            chat = {
                show_settings = 'true',
            },
        },
        strategies = {
            agent = {
                adapter = 'codellama',
            },
            chat = {
                adapter = 'codellama',
            },
            inline = {
                adapter = 'codellama',
                keymaps = {
                    accept_change = {
                        modes = { n = '<CR>' },
                        description = 'Accept the suggested change',
                    },
                    reject_change = {
                        modes = { n = '<Esc>' },
                        description = 'Reject the suggested change',
                    },
                },
            },
        },
        adapters = {
            codellama = function()
                return require('codecompanion.adapters').extend('ollama', {
                    schema = {
                        model = {
                            default = 'codellama:7b',
                        },
                    },
                })
            end,
        },
    },
    keys = {
        {
            '<leader>ac',
            function() require('codecompanion').toggle() end,
            desc = 'CodeCompanion toggle chat',
        },
        {
            '<leader>ai',
            function()
                local buf = vim.api.nvim_get_current_buf()
                vim.ui.input(
                    { prompt = 'CodeCompanion action: ' },
                    function(input)
                        if not input then
                            return
                        end

                        vim.api.nvim_buf_call(buf, function()
                            require('codecompanion').inline { args = input }
                        end)
                    end
                )
            end,
            desc = 'CodeCompanion inline action',
            mode = { 'n', 'v' },
        },
    },
}
