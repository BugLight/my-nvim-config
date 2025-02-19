return function ()
    local c = require("mellow.colors").dark

    vim.g.mellow_transparent = true
    vim.g.mellow_highlight_overrides = {
        ["FoldColumn"] = { bg = c.none, fg = c.gray05 },
        ["SignColumn"] = { bg = c.none, fg = c.gray05 },
        ["Normal"] = { fg = c.fg, bg = c.none },
        ["NormalNC"] = { fg = c.fg, bg = c.none },
        ["NormalFloat"] = { fg = c.fg, bg = c.none },
        ["FloatBorder"] = { fg = c.white, bg = c.none },

        -- Notify
        ["NotifyERRORBorder"] = { fg = c.red, bg = c.none },
        ["NotifyWARNBorder"] = { fg = c.yellow, bg = c.none },
        ["NotifyINFOBorder"] = { fg = c.blue, bg = c.none },
        ["NotifyDEBUGBorder"] = { fg = c.gray06, bg = c.none },
        ["NotifyTRACEBorder"] = { fg = c.cyan, bg = c.none },
        ["NotifyERRORBody"] = { fg = c.white, bg = c.none },
        ["NotifyWARNBody"] = { fg = c.white, bg = c.none },
        ["NotifyINFOBody"] = { fg = c.white, bg = c.none },
        ["NotifyDEBUGBody"] = { fg = c.white, bg = c.none },
        ["NotifyTRACEBody"] = { fg = c.white, bg = c.none },

        -- Telescope
        ["TelescopeBorder"] = { fg = c.white, bg = c.none },
        ["TelescopeNormal"] = { fg = c.fg, bg = c.none },

        ["TelescopePreviewTitle"] = { fg = c.green, bg = c.none, bold = true },
        ["TelescopeResultsTitle"] = { fg = c.blue, bg = c.none, bold = true },

        ["TelescopePromptTitle"] = { fg = c.gray06, bg = c.none, bold = true },
        ["TelescopePromptBorder"] = { fg = c.gray06, bg = c.none },
        ["TelescopePromptNormal"] = { fg = c.gray06, bg = c.none },
        ["TelescopePromptCounter"] = { fg = c.gray06, bg = c.none },

        ["TelescopeMatching"] = { fg = c.yellow, underline = true },
    }

    vim.cmd.colorscheme("mellow")
end

