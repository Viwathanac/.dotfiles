return {
    cmd = { "lua-language-server" },
    filetypes = { "lua" },
    root_markers = { { ".luarc.json", ".luarc.jsonc" }, ".git" },
    settings = {
        Lua = {
            codeLens = { enable = true },
            completion = {
                enable = true,
                autoRequire = true,
                callSnippet = "Replace",
                displayContext = 5,
                requireSeparator = "/",
            },
            workspace = {
                library = {
                    vim.fn.expand("$VIMRUNTIME/lua"),
                    vim.fn.expand("$XDG_CONFIG_HOME") .. "/nvim/lua",
                },
            },
            format = { enable = true },
            hint = {
                enable = true,
                semicolon = "disabled"
            },
        },
    },
    capabilities = require('cmp_nvim_lsp').default_capabilities()
}
