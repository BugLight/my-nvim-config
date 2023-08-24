return function()
    local get_hex = require('cokeline.utils').get_hex
    local is_picking_focus = require('cokeline.mappings').is_picking_focus
    local is_picking_close = require('cokeline.mappings').is_picking_close

    require('cokeline').setup {
        buffers = {
            filter_valid = function(buffer)
                -- Keep only current project related buffers unless buffer is
                -- modified
                local cwd = vim.fn.getcwd()
                return buffer.is_focused
                    or buffer.is_modified
                    or buffer.path:find(cwd, 1, true) == 1
            end,
            new_buffers_position = 'directory',
        },
        mappings = {
            disable_mouse = true,
        },
        history = {
            size = 5,
        },
        default_hl = {
            fg = function(buffer)
                return buffer.is_focused
                    and get_hex('Normal', 'fg')
                    or get_hex('Pmenu', 'fg')
            end,
            bg = function(buffer)
                return buffer.is_focused
                    and get_hex('Normal', 'bg')
                    or get_hex('Pmenu', 'bg')
            end
        },
        components = {
            {
                text = '▏',
                fg = get_hex('Normal', 'fg'),
            },
            {
                text = function(buffer)
                    return ((is_picking_focus() or is_picking_close())
                        and buffer.pick_letter
                        or buffer.index) .. ':  '
                end,
                fg = function()
                    return (is_picking_focus() or is_picking_close())
                        and get_hex('ErrorMsg', 'fg')
                        or get_hex('Normal', 'fg')
                end
            },
            {
                text = function(buffer) return buffer.devicon.icon end,
                fg = function(buffer) return buffer.devicon.color end,
            },
            {
                text = function(buffer)
                    return buffer.unique_prefix .. buffer.filename
                end,
                bold = function(buffer) return buffer.is_focused end,
                italic = function(buffer) return buffer.is_modified end,
            },
            {
                text = function(buffer)
                    return buffer.is_modified and '*' or ''
                end,
                italic = true
            },
            {
                text = '    ',
            }
        },
        sidebar = {
            filetype = 'NvimTree',
            components = {
                {
                    text = function()
                        return vim.fn.fnamemodify(vim.fn.getcwd(), ':~')
                    end,
                    bg = get_hex('Pmenu', 'bg'),
                },
            },
        },
    }

    require('history').setup()
end
