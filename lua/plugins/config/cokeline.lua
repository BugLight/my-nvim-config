return function()
    local get_hex = require('cokeline.utils').get_hex
    local is_picking_focus = require('cokeline.mappings').is_picking_focus
    local is_picking_close = require('cokeline.mappings').is_picking_close

    local prev_buffer = function(buffer)
        if buffer.index == 1 then
            return nil
        end
        return _G.cokeline.visible_buffers[buffer.index - 1]
    end

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
        fill_hl = 'Pmenu',
        components = {
            {
                text = function(buffer)
                    if buffer.is_focused then
                        return ' '
                    elseif buffer.index > 1
                           and prev_buffer(buffer).is_focused then
                        return ' '
                    end
                    return ' '
                end,
                fg = function(buffer)
                    if buffer.is_focused or buffer.index > 1
                       and prev_buffer(buffer).is_focused then
                        return get_hex('Pmenu', 'bg')
                    end
                    return get_hex('Normal', 'fg')
                end,
                bg = function(buffer)
                    if buffer.is_focused or buffer.index > 1
                       and prev_buffer(buffer).is_focused then
                        return get_hex('Normal', 'bg')
                    end
                    return get_hex('Pmenu', 'bg')
                end
            },
            {
                text = ' ',
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
                text = '   ',
            },
            {
                text = function(buffer)
                    return (buffer.is_last and buffer.is_focused)
                        and ' '
                        or ''
                end,
                fg = get_hex('Normal', 'bg'),
                bg = get_hex('Pmenu', 'bg')
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
end
