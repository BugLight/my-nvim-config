return function ()
    vim.cmd.colorscheme('catppuccin-mocha')

    -- Highlights
    vim.cmd.hi('clear', 'NormalFloat')
    vim.cmd.hi('link', 'NormalFloat', 'Normal')
end

