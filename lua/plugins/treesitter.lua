require('nvim-treesitter.configs').setup {
    ensure_installed = {
        "c",
        "cpp",
        "python",
        "lua",
    },
    highlight = {
        enable = true,
    }
}
