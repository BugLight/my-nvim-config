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
        extended_mode = true,
    },
}
