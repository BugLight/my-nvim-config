require('nvim-treesitter.configs').setup {
    ensure_installed = {
        "c",
        "cpp",
        "python",
        "lua",
        "javascript",
        "html",
        "vue",
    },
    highlight = {
        enable = true,
    },
    rainbow = {
        enable = true,
        extended_mode = true,
    },
}
