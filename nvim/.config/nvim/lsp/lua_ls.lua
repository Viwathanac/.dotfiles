local M = {
    cmd = { "lua-language-server" },
    filetypes = { "lua" },
    root_markers = { { '.luarc.json', '.luarc.jsonc' }, '.git' },
    settings = {
        Lua = {
            format = { enable = false },
            diagnostics = { globals =  {"vim"} },
            runtime = {
                pathStrict = true,
                version = "LuaJIT",
                path = {
                    "lua/?.lua",
                    "lua/?/init.lua",
                },
            },
            workspace = {
                library = {
                    [vim.fn.expand("$VIMRUNTIME/lua")] = true,
                    [vim.fn.stdpath("config") .. "/lua"] = true,
                },
            },
        },
    },
}

return M
