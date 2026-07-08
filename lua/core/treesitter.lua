local M = {}

---@param opts table|nil Options:
---  - ft? (string|string[])
---  - old_syntax? (bool) false by default
function M.register_parser(lang, opts)
    opts = opts or {}
    vim.api.nvim_create_autocmd('FileType', {
        pattern = opts.ft or lang,
        callback = function(ev)
            if vim.treesitter.language.add(lang) then
                vim.treesitter.language.register(lang, opts.ft or lang)
                vim.treesitter.start(ev.buf, lang)
                if opts.old_syntax then
                    vim.bo[ev.buf].syntax = 'ON'
                end
            end
        end
    })
end

function M.setup()
    local langs = {
        cmake = {},
        cpp = { old_syntax = true },
        nix = {},
        python = {},
        rust = {},
    }

    for lang, opts in pairs(langs) do
        M.register_parser(lang, opts)
    end
end

return M
