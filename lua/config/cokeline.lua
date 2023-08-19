return function()
    local get_hex = require('cokeline/utils').get_hex

    require('cokeline').setup {
        buffers = {
            filter_valid = function(buffer)
                -- Keep only current project related buffers
                local cwd = vim.fn.getcwd()
                return buffer.path:find(cwd, 1, true) == 1
            end,
            new_buffers_position = 'directory',
        },
        mappings = {
            disable_mouse = true,
        },
        history = {
            size = 5,
        },
        components = {
            {
                text = function(buffer) return (buffer.index ~= 1) and '▏' or '' end,
                fg = get_hex('Normal', 'fg')
            },
            {
                text = function(buffer) return '    ' .. buffer.devicon.icon end,
                fg = function(buffer) return buffer.devicon.color end,
            },
            {
                text = function(buffer) return buffer.unique_prefix .. buffer.filename .. '    ' end,
                style = function(buffer) return buffer.is_focused and 'bold' or nil end,
            },
            {
                text = '  ',
            },
        },
        sidebar = {
            filetype = 'NvimTree',
            components = {
                {
                    text = '',
                    bg = get_hex('NvimTreeNormal', 'bg'),
                },
            },
        },
    }

    require('history').setup()
end
